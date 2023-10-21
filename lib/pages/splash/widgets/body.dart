import 'package:flutter/material.dart';
import 'package:slashdiscount/styles/colors.dart';
import 'package:slashdiscount/utils/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          child: Image.asset(
            "assets/images/bg.png",
            height: size.height,
            width: size.width,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(seconds: 2),
                decoration: const BoxDecoration(),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Colors.white,width: 3),
                      boxShadow: const [
                        BoxShadow(
                          color: MyColor.disabledColor,
                          blurRadius: 2.0,
                        )
                      ]
                    ),
                    child: Image.asset(Constants.appLogo,height: 120,)),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(seconds: 2),
                decoration: const BoxDecoration(),
                child: const SizedBox(
                    height: 120,
                    width: 120,
                    child:  CircularProgressIndicator(color: MyColor.primaryColor)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
