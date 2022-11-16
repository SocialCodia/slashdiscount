import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slashdiscount/styles/colors.dart';

import '../controllers/widget_controller.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  final double textSize;

  RoundedButton({Key? key, required this.text, required this.onPress,this.textSize = 17})
      : super(key: key);

  final WidgetController widgetController = Get.find<WidgetController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(
          () => InkWell(
        onTap: widgetController.isButtonProcessing.value ? null : () => onPress() ,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          alignment: Alignment.center,
          height: 50,
          width: widgetController.isButtonProcessing.value ? 50 : size.width * 0.75,
          decoration: BoxDecoration(
            // color: widgetController.isButtonProcessing.value ? MyColor.disabledColor.withOpacity(0.5) : MyColor.primaryColor,
            color: widgetController.isButtonProcessing.value ? MyColor.primaryColor : MyColor.primaryColor,
            borderRadius: BorderRadius.circular(
                widgetController.isButtonProcessing.value ? 50 : 8),
          ),
          child: widgetController.isButtonProcessing.value
              ? const CircularProgressIndicator(color: MyColor.secondaryColor,)
              : Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white,fontSize: textSize),
          ),
        ),
      ),
    );
  }
}