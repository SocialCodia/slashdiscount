import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:slashdiscount/controllers/vendor_controller.dart';
import 'dart:io';

import '../../../widgets/widget_loading.dart';

class WidgetScanner extends StatefulWidget {
  const WidgetScanner({Key? key}) : super(key: key);

  @override
  State<WidgetScanner> createState() => _WidgetScannerState();
}

class _WidgetScannerState extends State<WidgetScanner> {
  VendorController vendorController = Get.find<VendorController>();
  GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // this code is only for development, I am using it to resume and pause camera on hot reload only. @mufazmi
  @override
  void reassemble() {
    if (Platform.isAndroid) {
      vendorController.qrViewController?.pauseCamera();
    } else if (Platform.isIOS) {
      vendorController.qrViewController?.resumeCamera();
    }
    super.reassemble();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: QRView(
              key: qrKey, onQRViewCreated: vendorController.onQRViewCreated,overlay: QrScannerOverlayShape()),
        ),
        Obx(
        ()=> vendorController.isVendorLoading.value ? const Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: WidgetLoading(),
          ) : const SizedBox(),
        ),
      ],
    );
  }

  @override
  void dispose() {
    vendorController.qrViewController?.dispose();
    super.dispose();
  }
}
