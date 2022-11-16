import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:slashdiscount/routes/routes.dart';
import 'package:slashdiscount/styles/colors.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        image: Image.asset("assets/images/1.png",),
        title: "Get Unlimited Discount",
        body:
        "Get Unlimited Discount Get Unlimited Discount Get Unlimited Discount Get Unlimited Discount Get Unlimited Discount Get Unlimited Discount Get Unlimited Discount Get Unlimited Discount Get Unlimited Discount Get Unlimited Discount Get Unlimited Discount Get Unlimited Discount ",
        decoration: getPageDecoration(),
      ),
      PageViewModel(
        image: Image.asset("assets/images/2.png"),
        title: "Get Discount On Every Purchase",
        body:
        "Get Discount On Every Purchase Get Discount On Every Purchase Get Discount On Every Purchase Get Discount On Every Purchase Get Discount On Every Purchase Get Discount On Every Purchase Get Discount On Every Purchase Get Discount On Every Purchase Get Discount On Every Purchase",
        decoration: getPageDecoration(),
      ),
      PageViewModel(
        image: Image.asset("assets/images/3.png"),
        title: "Win Amazing Cashback",
        body:
        "Win Amazing Cashback Win Amazing Cashback Win Amazing Cashback Win Amazing Cashback Win Amazing Cashback Win Amazing Cashback Win Amazing Cashback Win Amazing Cashback Win Amazing Cashback Win Amazing Cashback Win Amazing Cashback Win Amazing Cashback Win Amazing Cashback Win Amazing Cashback Win Amazing Cashback",
        decoration: getPageDecoration(),
      ),
    ];
  }

  PageDecoration getPageDecoration() => const PageDecoration(
      contentMargin: EdgeInsets.symmetric(vertical: 50, horizontal: 30),
      pageColor: Colors.white,
      titleTextStyle: TextStyle(
          color: MyColor.primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 24),
      bodyTextStyle: TextStyle(fontSize: 14));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          showNextButton: true,
          showSkipButton: true,
          done: const Text("Done"),
          onDone: () => Get.offAndToNamed(Routes.dashboardRoute),
          skip: const Text('Skip'),
          next: const Icon(Icons.arrow_forward),
          pages: getPages(),
        ),
      ),
    );
  }
}