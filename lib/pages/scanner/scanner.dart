import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:slashdiscount/controllers/vendor_controller.dart';
import 'dart:io';

import '../../routes/routes.dart';

class ScannerPage extends StatefulWidget {
  ScannerPage({Key? key}) : super(key: key);


  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {

  VendorController vendorController = Get.find<VendorController>();
  GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  // this code is only for development, I am using it to resume and pause camera on hot reload only. @mufazmi
  @override
  void reassemble() {
    if(Platform.isAndroid){
      vendorController.qrViewController?.pauseCamera();
    }else if(Platform.isIOS){
      vendorController.qrViewController?.resumeCamera();
    }
    super.reassemble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: QRView(key: qrKey,onQRViewCreated: onQRViewCreated),
          )
        ],
      )
    );
  }

  void onQRViewCreated(QRViewController controller){
    bool scanned = false;
    vendorController.qrViewController = controller;
    controller.scannedDataStream.listen((scanData) {
      if(!scanned){
        scanned = true;
        HapticFeedback.heavyImpact();
        vendorController.qrViewController?.pauseCamera();
        print('QR SCAN DATA IS '+scanData.toString());
        Get.offAndToNamed(Routes.paymentRoute);
      }
    });
  }

  @override
  void dispose() {
    vendorController.qrViewController?.dispose();
    super.dispose();
  }

}
