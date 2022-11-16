import 'package:flutter/material.dart';
import 'package:slashdiscount/controllers/auth_controller.dart';
import 'package:slashdiscount/pages/login/widgets/form_new_user.dart';
import 'package:slashdiscount/pages/login/widgets/login_form.dart';
import 'package:get/get.dart';
import 'package:slashdiscount/pages/login/widgets/otp_form.dart';
import 'package:slashdiscount/utils/constants.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: Obx(
        () => Center(
          child: SingleChildScrollView(
            child: authController.loginPageType.value == Constants.loginTypeOtp
                ? OtpForm()
                : authController.loginPageType.value == Constants.loginTypeNewUser
                    ? NewUserForm()
                    : LoginForm(),
          ),
        ),
      ),
    );
  }
}
