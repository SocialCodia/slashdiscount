import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slashdiscount/controllers/vendor_controller.dart';

import '../../../controllers/auth_controller.dart';
import '../../../styles/colors.dart';

class WidgetCongrats extends StatelessWidget {
  final VendorController vendorController = Get.find<VendorController>();

  WidgetCongrats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      // padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: MyColor.primaryColor,width: 2),
          boxShadow: const [
            BoxShadow(color: MyColor.placeHolderColor, blurRadius: 2.0)
          ]),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            alignment: Alignment.center,
            width: size.width,
            decoration: const BoxDecoration(
                color: MyColor.primaryColor
            ),
            child: Text("Discount Available at Min Amount ${vendorController.vendor.minimumAmount} Rs",style: const TextStyle(
                color: MyColor.secondaryColor,
                fontSize: 15
            ),),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            "Congratulations!!",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: MyColor.primaryColor),
          ),
          Text(
              "You've Earned ${vendorController.vendor.discount.toString()}% Discount"),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
