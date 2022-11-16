import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slashdiscount/controllers/vendor_controller.dart';
import 'package:slashdiscount/pages/scanner/widgets/payment_type.dart';
import 'package:slashdiscount/utils/constants.dart';
import 'package:slashdiscount/widgets/rounded_button.dart';

import 'widgets/body.dart';

class ScannerPage extends StatelessWidget {
  ScannerPage({Key? key}) : super(key: key);

  final VendorController vendorController = Get.find<VendorController>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // vendorController.isScanned.value = false;
    return WillPopScope(
      onWillPop: () async {
        vendorController.isScanned.value = false;

        return true;
      },
      child: GetBuilder<VendorController>(
        builder: (controller) => Scaffold(
          appBar: controller.isScanned.value
              ? AppBar(
                  title:  Obx(()=>Text(vendorController.isVendorLoading.value ? Constants.appName : vendorController.vendor.name.toString())),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))))
              : null,
          body: const Body(),
          bottomNavigationBar: GetBuilder<VendorController>(
            builder: (controller) => controller.isScanned.value
                ? Container(
                    height: size.height * .25,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(.3),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        WidgetPaymentType(),
                        RoundedButton(
                          text: "Pay ₹ ${vendorController.discountPrice}/-",
                          onPress: () {},
                          textSize: 20,
                        )
                      ],
                    ),
                  )
                : const SizedBox(),
          ),
        ),
      ),
    );
  }
}
