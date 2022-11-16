import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slashdiscount/handlers/sp_handler.dart';
import 'package:slashdiscount/routes/routes.dart';
import 'widgets/body.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  endSplash() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offAndToNamed(SpHandler.isLoggedIn() ? Routes.dashboardRoute : Routes.dashboardRoute);
  }

  @override
  void initState() {
    super.initState();
    endSplash();
  }

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: Body(),
    );
  }
}
