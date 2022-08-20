import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slashdiscount/controllers/vendor_controller.dart';
import 'dart:io';

class ScannerPage extends StatefulWidget {
  ScannerPage({Key? key}) : super(key: key);


  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {

  final VendorController vendorController = Get.find<VendorController>();

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
      body: Text("asdf"),
    );
  }
}
