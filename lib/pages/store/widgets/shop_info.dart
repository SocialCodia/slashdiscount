import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:slashdiscount/models/vendor.dart';

import '../../../styles/colors.dart';
import '../../../utils/constants.dart';

class WidgetShopInfo extends StatelessWidget {
  final Vendor vendor;
  const WidgetShopInfo({Key? key,required this.vendor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: size.height * .1, right: 20, left: 20),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.3), blurRadius: 5.0)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: size.width * .6,
                  child: Text(
                    vendor.name.toString(),
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: MyColor.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border:
                      Border.all(color: MyColor.primaryColor, width: 2),
                      borderRadius: BorderRadius.circular(50)),
                  child: ClipRRect(
                    clipBehavior: Clip.hardEdge,
                    borderRadius: BorderRadius.circular(50),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      height:  size.height * .06,
                      width:  size.height * .06,
                      imageUrl: vendor.logo.toString(),
                      placeholder: (context, url) =>
                          Image.asset(Constants.placeHolderImage),
                      errorWidget: (context, url, error) =>
                          Image.asset(Constants.placeHolderImage),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                vendor.category.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(vendor.email.toString()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  vendor.mobile.toString(),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: MyColor.primaryColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Icon(
                    Icons.call,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
