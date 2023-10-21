import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slashdiscount/controllers/dashboard_controller.dart';
import 'package:slashdiscount/routes/routes.dart';
import 'package:slashdiscount/styles/colors.dart';


class DashboardPage extends StatelessWidget {

  final DashboardController dashboardController = Get.find<DashboardController>();
  DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(()=>dashboardController.screens[dashboardController.screenNumber.value]),
        floatingActionButton: FloatingActionButton(
          onPressed: ()=> Get.toNamed(Routes.scannerRoute),
          tooltip: "Scan QR code",
          child: const Icon(Icons.qr_code),
          backgroundColor: MyColor.primaryColor,
        ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Item(title: "Home",icon: Icons.home,onPress: ()=> dashboardController.screenNumber.value = 0,)),
            Expanded(child: Item(title: "Store",icon: Icons.store,onPress:  ()=> dashboardController.screenNumber.value = 1,)),
            const Expanded(child: Item()),
            Expanded(child: Item(title: "Offers",icon: Icons.history,onPress:  ()=> dashboardController.screenNumber.value = 2,)),
            Expanded(child: Item(title: "Profile",icon: Icons.person,onPress:  ()=> dashboardController.screenNumber.value = 3,))
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class Item extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final VoidCallback? onPress;
  const Item({Key? key,this.title, this.icon,this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size(55,55),
      child: InkWell(
        onTap: onPress,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon == null ? const SizedBox() :Icon(icon),
            title == null ? const SizedBox() : Text(title!)
          ],
        ),
      ),
    );
  }
}
