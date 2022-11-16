import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:slashdiscount/controllers/home_controller.dart';
import 'package:slashdiscount/models/vendor.dart';
import 'package:slashdiscount/pages/store/store_details.dart';
import 'package:slashdiscount/pages/stores/store.dart';
import 'package:slashdiscount/pojos/response_vendors.dart';
import 'package:slashdiscount/services/vendor_service.dart';
import 'package:slashdiscount/utils/audio_helper.dart';
import 'package:slashdiscount/utils/snakbars.dart';

import '../utils/constants.dart';

class VendorController extends GetxController {
  var isTopVendorsLoading = true.obs;
  var isVendorsLoading = true.obs;
  var isVendorLoading = false.obs;
  var isScanned = false.obs;
  var paymentType = Constants.paymentTypeUpi.obs;
  var discountPrice = 0.obs;
  var discountedAmount = 0.obs;
  var preDiscountValue = 0.obs;
  List<Vendor> topVendorsList = [];
  List<Vendor> vendorsList = [];
  late Vendor vendor;
  late BitmapDescriptor mapMarkerIcon;

  GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  Barcode? barcode;
  QRViewController? qrViewController;

  TextEditingController priceController = TextEditingController();
  TextEditingController discountInputController = TextEditingController();

  final HomeController homeController = Get.find<HomeController>();

  Set<Marker> mapMarker = {};

  final formatCurrency = NumberFormat.simpleCurrency(
    locale: "en_US",
    name: 'INR',
  );

  void onChangeDiscountPrice(wallet) {
    if (int.parse(wallet.isEmpty ? '0' : wallet) <=
        int.parse(priceController.text.replaceAll(',', ''))) {
      preDiscountValue.value = int.parse(wallet.isEmpty ? '0' : wallet);
      discountInputController.value = TextEditingValue(
          text: wallet,
          selection: TextSelection(
              baseOffset: wallet.length, extentOffset: wallet.length));
    } else {
      String text = preDiscountValue.value.toString();
      discountInputController.value = TextEditingValue(
          text: preDiscountValue.value.toString(),
          selection: TextSelection(
              baseOffset: text.length, extentOffset: text.length));
      print('false');
    }
    getDiscountFromVendor();
  }

  void onChangePrice(price) {
    price = price.isNotEmpty ? price.replaceAll(',', '') : '0';
    var newPrice = formatCurrency
        .format(int.parse(price))
        .replaceAll('.00', '')
        .replaceAll('₹', '');
    priceController.value = TextEditingValue(
        text: newPrice,
        selection: TextSelection(
            baseOffset: newPrice.length, extentOffset: newPrice.length));
    getDiscountFromVendor();
  }

  void getDiscountFromVendor() {
    int mainInputPrice = int.parse(priceController.text.isEmpty
        ? '0'
        : priceController.text.replaceAll(',', ''));
    int discountInputPrice = int.parse(discountInputController.text.isEmpty
        ? '0'
        : discountInputController.text);
    int mPrice = 0;
    int mDiscountedAmount = 0;
    if (mainInputPrice >= int.parse(vendor.minimumAmount!)) {
      mPrice = (mainInputPrice * .10).roundToDouble().toInt();
      mDiscountedAmount = mPrice;
    } else {
      mPrice = 0;
      mDiscountedAmount = 0;
    }
    discountedAmount.value = mDiscountedAmount;
    int p = mainInputPrice - mPrice - discountInputPrice;

    print("mainInputPrice $mainInputPrice mPrice $mPrice p $p");
    discountPrice.value = p;
    update();
  }

  void onMapCreated(GoogleMapController controller) {
    mapMarker.add(Marker(
        markerId: const MarkerId("01"),
        position: const LatLng(19.1702813, 73.025802),
        icon: mapMarkerIcon));
    update();
  }

  @override
  void onInit() {
    getTopVendors();
    setMapMarker();
    super.onInit();
  }

  void onQRViewCreated(QRViewController controller) {
    qrViewController = controller;
    controller.scannedDataStream.listen((scanData) {
      String? qr = scanData.code;
      print(qr);
      if (qr == null ||
          qr.length < 5 ||
          qr.length > Constants.vendorQrCodeLength) {
        return SnackBars.showErrorSnackBar(message: "Invalid QR COde");
      }
      if (!isScanned.value || 1 == 1) {
        getVendorById(id: qr);
        HapticFeedback.heavyImpact();
        qrViewController?.pauseCamera();
        AudioHelpers.playBeep();
      }
    });
  }

  void sendToStoreDetails({vendor}) {
    this.vendor = vendor;
    update();
    Get.to(() => StoreDetails(vendor: vendor));
  }

  void setMapMarker() async {
    mapMarkerIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), 'assets/images/icons/map.png');
  }

  void sendToStore({category}) {
    isVendorsLoading(true);
    homeController.selectedCategoryName.value = category;
    update();
    Get.to(() => StorePage(
          showBackButton: true,
        ));
    getVendorsByCategory();
  }

  Future<void> getVendorById({id}) async {
    isVendorLoading(true);
    update();
    try {
      final ResponseVendors responseVendors =
          await VendorService.getVendorById(id: id);
      if (responseVendors.status == 200) {
        vendor = responseVendors.data![0];
      }
      isScanned(true);
    } finally {
      isVendorLoading(false);
      update();
    }
  }

  Future<void> getVendorsByCategory() async {
    isVendorsLoading(true);
    update();
    final ResponseVendors responseVendors =
        await VendorService.getVendorsByCategory(
            category: homeController.selectedCategoryName.value);
    vendorsList = responseVendors.data!;
    isVendorsLoading(false);
    update();
  }

  Future<void> getTopVendors() async {
    isTopVendorsLoading(true);
    final ResponseVendors responseVendors = await VendorService.getTopVendors();
    topVendorsList = responseVendors.data!;
    isTopVendorsLoading(false);
    update();
  }
}
