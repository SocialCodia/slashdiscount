import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slashdiscount/controllers/home_controller.dart';
import 'package:slashdiscount/utils/constants.dart';
import 'package:slashdiscount/widgets/items/item_category_one.dart';
import 'package:slashdiscount/widgets/title.dart';

class WidgetCategory extends StatelessWidget {
  WidgetCategory({Key? key}) : super(key: key);

  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * .16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const MyTitle(title: "Categories"),
          Expanded(
            child: ListView.builder(
                itemCount: homeController.categoryNames.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return Center(child: ItemCategoryOne(title: homeController.categoryNames[index], image: Constants.pathIcons+homeController.categoryIcon[index],));
                }),
          )
        ],
      ),
    );
  }
}

