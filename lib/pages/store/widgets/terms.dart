import 'package:flutter/material.dart';
import 'package:slashdiscount/utils/constants.dart';

class WidgetTerms extends StatelessWidget {
  final String minAmount;
  const WidgetTerms({Key? key,this.minAmount = '0'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Terms & Condition : "+Constants.termsOffer,style: TextStyle(
            color: Colors.red
          ),),
          Text("Discount applicable on Minimum "+minAmount+"/- and above",style: const TextStyle(
            fontWeight: FontWeight.bold
          ),)
        ],
      ),
    );
  }
}
