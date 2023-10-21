import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:slashdiscount/controllers/vendor_controller.dart';

class WidgetAddress extends StatelessWidget {
  WidgetAddress({Key? key}) : super(key: key);

  final VendorController vendorController = Get.find<VendorController>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GetBuilder<VendorController>(builder: (controller) {
      return Container(
        height: size.height * .30,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 5.0)
            ]),
        child: Column(children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  clipBehavior: Clip.hardEdge,
                  child: GoogleMap(
                    onMapCreated: controller.onMapCreated,
                    markers: controller.mapMarker,
                    initialCameraPosition: const CameraPosition(
                        target: LatLng(19.1702813, 73.025802), zoom: 15),
                  )),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 10),
              child: Text(
                  "Address : " + vendorController.vendor.address.toString())),
        ]),
      );
    });
  }
}
