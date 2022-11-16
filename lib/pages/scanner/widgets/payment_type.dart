import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slashdiscount/controllers/vendor_controller.dart';
import 'package:slashdiscount/styles/colors.dart';
import 'package:slashdiscount/styles/style.dart';
import 'package:slashdiscount/utils/constants.dart';

class WidgetPaymentType extends StatelessWidget {
  WidgetPaymentType({Key? key}) : super(key: key);

  final VendorController vendorController = Get.find<VendorController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: ()=> vendorController.paymentType.value = Constants.paymentTypeUpi,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                boxShadow: Styles.boxShadow,
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border:
                    vendorController.paymentType.value == Constants.paymentTypeUpi
                        ? Border.all(color: MyColor.primaryColor, width: 2.0)
                        : null,
              ),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/icons/upi.png",
                    height: 60,
                    width: 60,
                  ),
                  const Text(
                    "UPI",
                    style: TextStyle(color: MyColor.primaryColor, fontSize: 18),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          InkWell(
            onTap: ()=> vendorController.paymentType.value = Constants.paymentTypeCash,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                boxShadow: Styles.boxShadow,
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border:
                    vendorController.paymentType.value == Constants.paymentTypeCash
                        ? Border.all(color: MyColor.primaryColor, width: 2.0)
                        : null,
              ),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/icons/cash.png",
                    height: 60,
                    width: 60,
                  ),
                  const Text(
                    "CASH",
                    style: TextStyle(color: MyColor.primaryColor, fontSize: 18),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
