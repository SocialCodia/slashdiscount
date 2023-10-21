import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slashdiscount/controllers/home_controller.dart';
import 'package:slashdiscount/utils/constants.dart';
import 'package:slashdiscount/widgets/items/item_category.dart';
import 'package:slashdiscount/widgets/title.dart';

class WidgetCategory extends StatelessWidget {
  WidgetCategory({Key? key}) : super(key: key);

  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * .17,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MyTitle(title: "Categories"),
          Expanded(
            child: ListView.builder(
                itemCount: homeController.categoryNames.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
              return ItemCategory(title: homeController.categoryNames[index], image: Constants.pathIcons+homeController.categoryIcon[index],);
            }),
          )
        ],
      ),
    );
  }
}

