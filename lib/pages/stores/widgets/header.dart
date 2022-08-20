import 'package:flutter/material.dart';
import 'package:slashdiscount/styles/colors.dart';


class SearchHeader extends StatelessWidget {
  final Widget child;
  const SearchHeader({Key? key,required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: MyColor.primaryColor,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(40),bottomLeft: Radius.circular(40))
      ),
      child: Stack(
        children: [
          child
        ],
      ),
    );
  }
}