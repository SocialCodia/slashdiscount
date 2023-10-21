import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slashdiscount/pages/scanner/widgets/paying.dart';
import 'package:slashdiscount/pages/scanner/widgets/wallet.dart';

import 'congrats.dart';

class WidgetMakePayment extends StatelessWidget {
  const WidgetMakePayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            WidgetCongrats(),
            const SizedBox(
              height: 20,
            ),
            WidgetPaying(),
            const SizedBox(
              height: 20,
            ),
            const WidgetWallet()
          ],
        ),
      ),
    );
  }
}



