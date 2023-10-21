import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slashdiscount/controllers/auth_controller.dart';
import 'package:slashdiscount/styles/colors.dart';
import 'package:slashdiscount/utils/validator.dart';
import 'package:slashdiscount/widgets/rounded_input_field.dart';

import '../../../widgets/rounded_button.dart';

class NewUserForm extends StatelessWidget {
  NewUserForm({Key? key}) : super(key: key);
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Form(
      key: authController.otpFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/icons/login.png",
            height: size.height * .3,
            width: size.width * .8,
          ),
          const Text(
            "Signup Form",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              "We have sent the verification code to your Mobile Number",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: size.height * .02,
          ),
          RoundedInputField(
              hintText: "Enter Name",
              controller: authController.nameController,
              icon: Icons.person,
              validator: Validator.validateName),
          SizedBox(
            height: size.height * .015,
          ),
          RoundedInputField(
            isEnabled: false,
              hintText: "Enter Mobile",
              controller: authController.mobileController,
              icon: Icons.call,
              validator: Validator.validateMobile),
          SizedBox(
            height: size.height * .015,
          ),
          RoundedInputField(
              hintText: "Enter Email",
              controller: authController.emailController,
              icon: Icons.email,
              validator: Validator.validateEmail),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Obx(()=> Checkbox(value: authController.isAcceptedTerms.value, onChanged: (value)=> authController.isAcceptedTerms.value = value!)),
              const Text("I agree "),
              const SizedBox(
                width: 3,
              ),
              const Text(
                "(Terms & Condition)",
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              )
            ],
          ),
          RoundedButton(text: "Submit", onPress: () {}),
          SizedBox(
            height: size.height * .02,
          ),
        ],
      ),
    );
  }
}
