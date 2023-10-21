import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slashdiscount/controllers/vendor_controller.dart';
import 'widgets/body.dart';

import '../../widgets/drawers/drawer.dart';

class StorePage extends StatelessWidget {
  final bool showBackButton;
  StorePage({Key? key,this.showBackButton=false}) : super(key: key);

  final VendorController vendorController = Get.find<VendorController>();

  @override
  Widget build(BuildContext context) {
    if(!showBackButton){
      vendorController.getVendorsByCategory();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stores"),
      ),
      drawer: showBackButton?  null : MyDrawer(),
      body: Body(),
    );
  }
}
