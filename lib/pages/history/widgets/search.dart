import 'package:flutter/material.dart';
import 'package:slashdiscount/styles/colors.dart';

import 'header.dart';

class WidgetSearch extends StatelessWidget {
  const WidgetSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SearchHeader(
      child: Container(
        margin: const EdgeInsets.only(right: 20,left: 16,top: 0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: const [
              BoxShadow(color: Colors.grey, blurRadius: 5.0),
            ]),
        child: TextFormField(
          textAlignVertical: TextAlignVertical.center,
          // controller: filterController.searchInputController,
          decoration: InputDecoration(
            hintText: "Search Services & Stores",
            border: InputBorder.none,
            prefixIcon: const Icon(Icons.search,color: MyColor.primaryColor,),
            suffixIcon: IconButton(onPressed: ()=>{}, icon: const Icon(Icons.arrow_forward_rounded,color: MyColor.primaryColor)),
          ),
        ),
      ),
    );
  }
}