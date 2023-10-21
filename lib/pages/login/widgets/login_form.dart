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
    final Size size = MediaQuery.of(context).size;
    return Form(
      key: authController.loginFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/icons/login.png",
            height: size.height * .3,
            width: size.width * .8,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Enter your phone Number",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const Padding(
            padding:  EdgeInsets.all(12),
            child:  Text(
              "We will send you 6 digit verification code",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          RoundedInputField(
            hintText: "Mobile",
            controller: authController.mobileController,
            icon: Icons.call,
            validator: Validator.validateMobile,
            keyboardType: TextInputType.phone,
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
