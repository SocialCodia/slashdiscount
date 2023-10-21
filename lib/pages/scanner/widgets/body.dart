import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slashdiscount/controllers/vendor_controller.dart';
import 'package:slashdiscount/pages/scanner/widgets/make_payment.dart';
import 'package:slashdiscount/pages/scanner/widgets/scanner.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VendorController>(builder: (controller)=> controller.isScanned.value ? SingleChildScrollView(child: WidgetMakePayment()) : WidgetScanner());
  }
}
