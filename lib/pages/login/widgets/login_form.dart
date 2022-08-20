import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slashdiscount/controllers/auth_controller.dart';
import 'package:slashdiscount/utils/validator.dart';
import 'package:slashdiscount/widgets/rounded_input_field.dart';

import '../../../widgets/rounded_button.dart';

class LoginForm extends StatelessWidget {
  LoginForm({Key? key}) : super(key: key);
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: authController.loginFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/icons/login.png",
            height: 200,
            width: 200,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Enter your phone Number",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const Text("We will send you 6 digit verification code"),
          const SizedBox(
            height: 20,
          ),
          RoundedInputField(
            hintText: "Mobile",
            controller: authController.mobileController,
            icon: Icons.call,
            validator: Validator.validateMobile,
            keyboardType: TextInputType.phone,
            counter: '10',
          ),
          const SizedBox(
            height: 20,
          ),
          RoundedButton(
            text: "Generate OTP",
            onPress: () => authController.userLogin(),
          )
        ],
      ),
    );
  }
}
