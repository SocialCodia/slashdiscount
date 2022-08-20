import 'package:flutter/material.dart';
import 'package:slashdiscount/controllers/auth_controller.dart';
import 'package:slashdiscount/pages/login/widgets/login_form.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoginForm()
        ],
      ),
    );
  }
}
