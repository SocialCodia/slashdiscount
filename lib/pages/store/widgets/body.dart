import 'package:flutter/material.dart';
import 'package:slashdiscount/models/vendor.dart';
import 'package:slashdiscount/pages/store/widgets/address.dart';
import 'package:slashdiscount/pages/store/widgets/discont.dart';
import 'package:slashdiscount/pages/store/widgets/shop_info.dart';
import 'package:slashdiscount/pages/store/widgets/terms.dart';

import 'background.dart';

class Body extends StatelessWidget {
  final Vendor vendor;

  const Body({Key? key, required this.vendor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Background(
        banner: vendor.banner.toString(),
        child: Column(
            children: [
              WidgetShopInfo(vendor: vendor),
              const SizedBox(
                height: 15,
              ),
              WidgetDiscount(vendor: vendor,),
              const SizedBox(
                height: 15,
              ),
              WidgetAddress(),
              const SizedBox(
                height: 15,
              ),
              WidgetTerms(minAmount: vendor.minimumAmount.toString(),)
        ]),
      ),
    );
  }
}

