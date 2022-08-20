
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:slashdiscount/controllers/widget_controller.dart';
import 'package:slashdiscount/handlers/sp_handler.dart';
import 'package:slashdiscount/routes/routes.dart';

class AuthController extends GetxController{

  var isLoginProcessing = false.obs;
  final WidgetController widgetController = Get.find<WidgetController>();

  var userName = 'Umair Farooqui'.obs;
  var userEmail = '+91-9867503256'.obs;

  final TextEditingController mobileController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  Future<void> logoutUser() async {
    SpHandler.logoutUser();
    Get.offAllNamed(Routes.loginRoute);
  }

  Future<void> userLogin() async {
    if(loginFormKey.currentState!.validate()){
      loginFormKey.currentState!.save();
      isLoginProcessing(true);
      widgetController.isButtonProcessing(true);
      try{
        await Future.delayed(const Duration(seconds: 3));
      }
      finally{
        isLoginProcessing(false);
        widgetController.isButtonProcessing(false);
      }
    }
    else{
      HapticFeedback.heavyImpact();
    }
  }

}