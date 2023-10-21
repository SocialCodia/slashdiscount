import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:slashdiscount/styles/colors.dart';

class SnackBars{

  static void showSuccessSnackBar({message,icon=Icons.check_circle}){
    Get.snackbar("Success", message,icon: Icon(icon));
  }

  static void showErrorSnackBar({message}){
    Get.closeAllSnackbars();
    Get.snackbar("Error", message,icon: const Icon(Icons.error),backgroundColor: MyColor.secondaryColor);
  }

}