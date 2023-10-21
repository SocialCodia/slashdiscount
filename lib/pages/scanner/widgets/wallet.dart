import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:slashdiscount/utils/validator.dart';
import 'package:slashdiscount/widgets/rounded_input_field.dart';

import '../../../controllers/vendor_controller.dart';
import '../../../styles/colors.dart';
import '../../../styles/style.dart';
import '../../../utils/constants.dart';

class WidgetWallet extends StatelessWidget {
  const WidgetWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [WidgetDiscountCard()],
    );
  }
}

class WidgetDiscountCard extends StatelessWidget {
  WidgetDiscountCard({Key? key}) : super(key: key);

  final VendorController vendorController = Get.find<VendorController>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      // padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: MyColor.primaryColor.withOpacity(0.1),width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          WidgetDiscount(),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: size.width * .3),
             child: TextFormField(
                controller: vendorController.discountInputController,
                decoration: const InputDecoration(
                  hintText: "Use Wallet Amount",
                  // prefix: Icon(Icons.currency_rupee),
                  enabledBorder: InputBorder.none,
                  // border: InputBorder.none,
                ),
                onChanged: vendorController.onChangeDiscountPrice,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(4),
                  FilteringTextInputFormatter.digitsOnly
                ],
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: MyColor.primaryColor,
                    fontWeight: FontWeight.w900,
                    fontSize: 20
                ),
              )
          ),
        ],
      ),
    );
  }
}

class WidgetDiscount extends StatelessWidget {
  WidgetDiscount({Key? key}) : super(key: key);

  final VendorController vendorController = Get.find<VendorController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 15),
          height: 80,
          width: 80,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            boxShadow: Styles.boxShadow,
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                ()=> Text(
                  vendorController.discountedAmount.value.toString(),
                  style: const TextStyle(
                      color: MyColor.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
              const Text(
                "Discount",
                style: TextStyle(color: MyColor.primaryColor, fontSize: 18),
              )
            ],
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Container(
          margin: const EdgeInsets.only(top: 15),
          height: 80,
          width: 80,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            boxShadow: Styles.boxShadow,
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "150",
                style: TextStyle(
                    color: MyColor.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              Text(
                "Wallet",
                style: TextStyle(color: MyColor.primaryColor, fontSize: 18),
              )
            ],
          ),
        )
      ],
    );
  }
}
