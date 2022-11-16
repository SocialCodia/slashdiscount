import 'package:flutter/material.dart';
import 'package:slashdiscount/models/vendor.dart';
import 'widgets/body.dart';

class StoreDetails extends StatelessWidget {
  final Vendor vendor;
  const StoreDetails({Key? key,required this.vendor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(vendor.name.toString()),
      ),
      body: Body(vendor: vendor,),
    );
  }
}
