import 'package:flutter/material.dart';
import 'package:slashdiscount/pages/home/widgets/slider.dart';
import 'package:slashdiscount/pages/home/widgets/vendor.dart';

import 'category.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 15,),
          const HomeSlider(),
          const SizedBox(height: 15,),
          WidgetCategory(),
          // Flexible(child: WidgetCategory()),
          const SizedBox(height: 15,),
          const WidgetTopVendors()
        ],
      ),
    );
  }
}
