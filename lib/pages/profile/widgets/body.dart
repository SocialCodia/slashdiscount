import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slashdiscount/controllers/auth_controller.dart';
import 'package:slashdiscount/utils/constants.dart';

import '../../../styles/colors.dart';

class Body extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: SingleChildScrollView(
        child: Background(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: size.height * 0.06,
                ),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 5),
                    borderRadius: BorderRadius.circular(50)),
                child: ClipRRect(
                    clipBehavior: Clip.hardEdge,
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(Constants.placeHolderImage)),
              ),
              const SizedBox(
                height: 5,
              ),
              Obx(
                () => Text(
                  authController.userName.value,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Obx(
                () => Text(
                  authController.userEmail.value,
                  style: const TextStyle(color: MyColor.disabledColor),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: size.width * 0.80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    RowCounts(
                      name: "Wallet Amount",
                      count: '650',
                    ),
                    RowCounts(
                      name: "Total Paid",
                      count: '8,653',
                    ),
                    RowCounts(
                      name: "Total Discount",
                      count: '1,652',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.grey.withOpacity(0.5),
              ),
              // SettingsList(),
            ],
          ),
        ),
      ),
    );
  }
}

class Background extends StatelessWidget {
  final Widget child;

  const Background({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        ClipPath(
          clipper: MyClipper(),
          child: Container(
            height: size.height * 0.18,
            color: MyColor.primaryColor,
          ),
        ),
        child
      ],
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height / 2);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height / 2);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class RowCounts extends StatelessWidget {
  final String count, name;

  const RowCounts({Key? key, required this.name, this.count = "0"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),
        ),
        Text(name, style: const TextStyle(color: MyColor.disabledColor))
      ],
    );
  }
}
