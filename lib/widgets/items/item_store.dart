import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slashdiscount/controllers/vendor_controller.dart';
import 'package:slashdiscount/models/vendor.dart';
import 'package:slashdiscount/pages/store/store_details.dart';
import 'package:slashdiscount/utils/constants.dart';

class ItemVendor extends StatelessWidget {
  final Vendor vendor;

  ItemVendor({Key? key, required this.vendor}) : super(key: key);
  final VendorController vendorController  = Get.find<VendorController>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      // margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
      padding: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 2.0,
            )
          ]),
      child: InkWell(
        onTap: ()=> vendorController.sendToStoreDetails(vendor: vendor),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  height: size.height * .1,
                  width: size.height * .1,
                  imageUrl: vendor.logo.toString(),
                  placeholder: (context, url) =>
                      Image.asset(Constants.placeHolderImage),
                  errorWidget: (context, url, error) =>
                      Image.asset(Constants.placeHolderImage),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            vendor.name.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        Text(
                          "Discount " + vendor.discount.toString() + "%",
                          style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          vendor.mobile.toString(),
                          style: const TextStyle(color: Colors.blue),
                        ),
                        Text(
                          "On Min Rs." + vendor.minimumAmount.toString(),
                          style: const TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Category: " + vendor.category.toString()),
                            SizedBox(
                                width: size.width * .45,
                                child: Text(
                                  vendor.address.toString(),
                                  overflow: TextOverflow.ellipsis,
                                )),
                          ],
                        ),
                        Image.asset(
                          'assets/images/icons/discount.png',
                          height: 35,
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
