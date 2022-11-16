
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:slashdiscount/controllers/widget_controller.dart';
import 'package:slashdiscount/handlers/sp_handler.dart';
import 'package:slashdiscount/models/user.dart';
import 'package:slashdiscount/routes/routes.dart';
import 'package:slashdiscount/utils/constants.dart';
import 'package:slashdiscount/utils/dialogs.dart';
import 'package:slashdiscount/utils/snakbars.dart';

import '../pojos/response_user.dart';
import '../services/auth_service.dart';

class AuthController extends GetxController{

  var isLoginProcessing = false.obs;
  final WidgetController widgetController = Get.find<WidgetController>();

  User user = SpHandler.getUser();




  var userName = SpHandler.getUserName().obs;
  var userEmail = SpHandler.getUserEmail().obs;
  var userMobile = SpHandler.getUserMobile().obs;

  var loginPageType = Constants.loginTypeLogin.obs;
  var isAcceptedTerms = false.obs;
  var loginOtp = ''.obs;

  final TextEditingController mobileController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();


  var random = Random();

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();

  Future<void> logoutUser() async {
    SpHandler.logoutUser();
    Get.offAllNamed(Routes.loginRoute);
  }

  Future<void> verifyOtp() async {

  }

  void showEditDialog(){
    print(loginPageType.value);
    Get.closeAllSnackbars();
    Dialogs.showConfirmationDialog(
      onConfirm: ()=> loginPageType.value = Constants.loginTypeNewUser,
      content: const Text("You want to Edit Mobile Number"),
      textConfirm: "Edit"
    );
  }

  Future<void> userLogin() async {
    if(loginFormKey.currentState!.validate()){
      loginFormKey.currentState!.save();
      isLoginProcessing(true);
      widgetController.isButtonProcessing(true);
      try{
        await Future.delayed(const Duration(seconds: 3));
        var otp = random.nextInt(900000) + 100000;
        loginOtp.value = otp.toString();
        userMobile.value = mobileController.text.toString();
        SnackBars.showSuccessSnackBar(message: "OTP has been sent!");
        loginPageType.value = Constants.loginTypeOtp;
        ResponseUser responseUser = await AuthService.userLogin(mobile: mobileController.text.toString(),otp: otp);
        if(responseUser.status == 200){
          user = responseUser.data![0];
          // isOtpSent.value = true;
          SpHandler.saveUser(user);
          update();
          SnackBars.showSuccessSnackBar(message: "OTP has been sent!");
        }
        else{
          SnackBars.showErrorSnackBar(message:"Oops..! Failed to send OTP");
        }
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