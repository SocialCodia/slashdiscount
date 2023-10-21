import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slashdiscount/controllers/auth_controller.dart';
import 'package:slashdiscount/styles/colors.dart';
import 'package:slashdiscount/utils/validator.dart';
import 'package:slashdiscount/widgets/rounded_input_field.dart';

import '../../../widgets/rounded_button.dart';

class OtpForm extends StatelessWidget {
  OtpForm({Key? key}) : super(key: key);
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
            "Verification Code",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),

          const Padding(
            padding:  EdgeInsets.all(12),
            child:  Text(
              "We have sent the verification code to your Mobile Number",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
              ()=> Text(
                  authController.userMobile.value,
                  style: const TextStyle(
                      color: MyColor.primaryColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              InkWell(
                onTap: () => authController.showEditDialog(),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      color: MyColor.primaryColor,
                      borderRadius: BorderRadius.circular(100)),
                  child: const Icon(Icons.edit, color: Colors.white, size: 10),
                ),
              )
            ],
          ),
          SizedBox(
            height: size.height * .02,
          ),
          RoundedInputField(
              keyboardType: TextInputType.number,
              hintText: "Enter OTP",
              controller: authController.otpController,
              icon: Icons.lock_open_outlined,
              validator: Validator.verifyOtp),
          SizedBox(
            height: size.height * .02,
          ),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Didn't receive OTP?"),
              SizedBox(
                width: 5,
              ),
              Text("RESEND OTP",style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold
              ),)
            ],
          ),
          SizedBox(
            height: size.height * .02,
          ),
          RoundedButton(
            text: "Verify OTP",
            onPress: () => authController.loginOtp(),
          )
        ],
      ),
    );
  }
}
