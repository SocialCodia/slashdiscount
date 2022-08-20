import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slashdiscount/controllers/home_controller.dart';
import 'package:slashdiscount/controllers/vendor_controller.dart';
import 'package:slashdiscount/styles/colors.dart';

class ItemCategory extends StatelessWidget {
  final String title, image;
  final HomeController homeController = Get.find<HomeController>();
  final VendorController vendorController = Get.find<VendorController>();
  ItemCategory({Key? key, required this.title, required this.image,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
        ()=> InkWell(
            onTap: (){
              homeController.selectedCategoryName.value = title;
              vendorController.getVendorsByCategory();
            },
            child: Container(
                height: 65,
                width: 65,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                decoration: BoxDecoration(
                  color: MyColor.secondaryColor,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: MyColor.primaryColor,style: homeController.selectedCategoryName.value == title ? BorderStyle.solid : BorderStyle.none),
                  boxShadow: [
                    BoxShadow(
                      color:homeController.selectedCategoryName.value == title ? Colors.grey : Colors.grey.withOpacity(0.3),
                      blurRadius:  homeController.selectedCategoryName.value == title ? 8.0 : 5.0
                    )
                  ]
                ),
                child: Image.asset(image)),
          ),
        ),
        const SizedBox(
          height:5,
        ),
        Text(title,style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 13
        ),)
      ],
    );
  }
}
