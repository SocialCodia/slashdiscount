import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slashdiscount/controllers/home_controller.dart';
import 'package:slashdiscount/styles/colors.dart';

class ItemCategory extends StatelessWidget {
  final String title, image;
  final HomeController homeController = Get.find<HomeController>();
  ItemCategory({Key? key, required this.title, required this.image,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
        ()=> InkWell(
            onTap: ()=> homeController.selectedCategoryName.value = title,
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
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius:  homeController.selectedCategoryName.value == title ? 0 : 5.0
                    )
                  ]
                ),
                child: Image.asset(image)),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(title,style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15
        ),)
      ],
    );
  }
}
