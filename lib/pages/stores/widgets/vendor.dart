import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slashdiscount/controllers/vendor_controller.dart';
import 'package:slashdiscount/models/vendor.dart';
import 'package:slashdiscount/widgets/items/item_store.dart';
import 'package:slashdiscount/widgets/shimmers/shimmer_default.dart';

class WidgetVendors extends StatelessWidget {
  const WidgetVendors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VendorController>(
      builder: (controller){
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.isVendorsLoading.value ? 6 : controller.vendorsList.length,
          itemBuilder: (context,index){
            if (controller.isVendorsLoading.value){
              return const ShimmerDefault(height: 100);
            }else{
              Vendor vendor = controller.vendorsList[index];
              return  ItemVendor(vendor: vendor,);
            }
          },
        );
      },
    );
  }
}
