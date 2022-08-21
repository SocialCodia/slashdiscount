
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:slashdiscount/controllers/home_controller.dart';
import 'package:slashdiscount/models/vendor.dart';
import 'package:slashdiscount/pages/store/store_details.dart';
import 'package:slashdiscount/pages/stores/store.dart';
import 'package:slashdiscount/pojos/response_vendors.dart';
import 'package:slashdiscount/services/vendor_service.dart';

class VendorController extends GetxController{

  var isTopVendorsLoading = true.obs;
  var isVendorsLoading = true.obs;
  List<Vendor> topVendorsList = [];
  List<Vendor> vendorsList = [];
  late Vendor vendor;
  late BitmapDescriptor mapMarkerIcon;

  GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  Barcode? barcode;
  QRViewController? qrViewController;


  final HomeController homeController = Get.find<HomeController>();

  Set<Marker> mapMarker = {};

  void onMapCreated(GoogleMapController controller){
    mapMarker.add(
      Marker(markerId: const MarkerId("01"),position: LatLng(19.1702813, 73.025802),icon: mapMarkerIcon)
    );
    update();
  }

  @override
  void onInit() {
    getTopVendors();
    setMapMarker();
    super.onInit();
  }

  void sendToStoreDetails({vendor}){
    this.vendor = vendor;
    update();
    Get.to(()=>StoreDetails(vendor: vendor));
  }

  void setMapMarker() async{
    mapMarkerIcon = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(), 'assets/images/icons/map.png');
  }

  void sendToStore({category}){
    isVendorsLoading(true);
    homeController.selectedCategoryName.value = category;
    update();
    Get.to(()=> StorePage(showBackButton: true,));
    getVendorsByCategory();
  }

  Future<void> getVendorsByCategory() async {
    isVendorsLoading(true);
    update();
    final ResponseVendors responseVendors = await VendorService.getVendorsByCategory(category: homeController.selectedCategoryName.value);
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