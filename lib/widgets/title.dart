import 'package:flutter/material.dart';
import 'package:slashdiscount/styles/colors.dart';

class MyTitle extends StatelessWidget {
  final String title;
  const MyTitle({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title,style: const TextStyle(
      color: MyColor.primaryColor,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    );
  }
}
