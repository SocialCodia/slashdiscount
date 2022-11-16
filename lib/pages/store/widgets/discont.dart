import 'package:flutter/material.dart';
import 'package:slashdiscount/styles/colors.dart';

import '../../../models/vendor.dart';


class WidgetDiscount extends StatelessWidget {
  final Vendor vendor;
  const WidgetDiscount({Key? key,required this.vendor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          WidgetDiscountItem(
            title: 'Discount',
            value: vendor.discount.toString()+'%',
          ),
          WidgetDiscountItem(
            title: 'Min Purchase',
            value: vendor.minimumAmount.toString(),
          ),
        ],
      ),
    );
  }
}

class WidgetDiscountItem extends StatelessWidget {
  final String? title,value;
  const WidgetDiscountItem({Key? key,this.title,this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
        alignment: Alignment.center,
        width: size.width * 0.3,
        height: size.height * .150,
        decoration: BoxDecoration(
            color: MyColor.primaryColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 2.0)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 12,
            ),
            Container(
              alignment: Alignment.center,
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: MyColor.secondaryColor,
                  borderRadius: BorderRadius.circular(50)),
              child: Text(
                value ?? '0',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: MyColor.primaryColor,
                    fontSize: 25),
              ),
            ),
            Text(
              title.toString(),
              style: const TextStyle(fontSize: 15, color: MyColor.secondaryColor),
            ),
            const SizedBox(
              height: 5,
            )
          ],
        ));
  }
}
