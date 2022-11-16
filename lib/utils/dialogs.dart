import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dialogs extends GetxController {

  static var confirmDialogCallback  =  false.obs;
  static var isConfirmationDialogProcessing = true.obs;

  static showConfirmationDialog(
      {title = "Are you sure?",
        content,
        textCancel = "Cancel",
        textConfirm = "Accept",
        onConfirm
      })

  {
    Get.defaultDialog(
      title: title,
      content: content,
      barrierDismissible: true,
      textConfirm: textConfirm,
      textCancel: textCancel,
      onConfirm:(){
        Get.back();
        onConfirm();
      },
      onCancel: (){
        isConfirmationDialogProcessing(false);
        confirmDialogCallback(false);
      },
    );
  }
}