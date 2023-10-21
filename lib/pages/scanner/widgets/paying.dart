import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../controllers/vendor_controller.dart';
import '../../../styles/colors.dart';

class WidgetPaying extends StatelessWidget {
  WidgetPaying({Key? key}) : super(key: key);

  final VendorController vendorController = Get.find<VendorController>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * .20 ,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("You are paying"),
          TextFormField(
            controller: vendorController.priceController,
            decoration: const InputDecoration(
              hintText: "₹0",
              // prefix: Icon(Icons.currency_rupee),
              enabledBorder: InputBorder.none,
              border: InputBorder.none,
            ),
            onChanged: vendorController.onChangePrice,
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(6),
              FilteringTextInputFormatter.digitsOnly
            ],
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: MyColor.primaryColor,
                fontWeight: FontWeight.w900,
                fontSize: 50
            ),
          )
        ],
      ),
    );
  }
}