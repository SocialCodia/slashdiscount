import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slashdiscount/controllers/auth_controller.dart';
import 'package:slashdiscount/pages/payment/payment.dart';
import 'package:slashdiscount/styles/colors.dart';
import 'package:slashdiscount/utils/constants.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({Key? key}) : super(key: key);

  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            color: MyColor.primaryColor,
            child: DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                  color: MyColor.primaryColor
                ),
                accountName: const Text("Social Codia"),
                accountEmail: const Text("+919867503256"),
                currentAccountPicture: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.black,width: 2)
                  ),
                  child: Image.asset(Constants.appLogo),
                ),
              ),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.person,color: MyColor.primaryColor,),
            title: Text("My Account",style: TextStyle(color: MyColor.primaryColor),),
          ),
          const ListTile(
            leading: Icon(Icons.account_balance_wallet,color: MyColor.primaryColor),
            title: Text("My Wallet",style: TextStyle(color: MyColor.primaryColor)),
          ),
          const ListTile(
            leading: Icon(Icons.credit_card,color: MyColor.primaryColor),
            title: Text("Slash VIP",style: TextStyle(color: MyColor.primaryColor)),
          ),
          const ListTile(
            leading: Icon(Icons.credit_card,color: MyColor.primaryColor),
            title: Text("Refer & Earn",style: TextStyle(color: MyColor.primaryColor)),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.info,color: MyColor.primaryColor),
            title: Text("About Us",style: TextStyle(color: MyColor.primaryColor)),
          ),
          ListTile(
            onTap: ()=> Get.to(()=>PaymentPage()),
            leading: Icon(Icons.call,color: MyColor.primaryColor),
            title: Text("Contact Us",style: TextStyle(color: MyColor.primaryColor)),
          ),
          ListTile(
            onTap: ()=> authController.logoutUser(),
            leading: const Icon(Icons.exit_to_app,color: MyColor.primaryColor),
            title: const Text("Logout",style: TextStyle(color: MyColor.primaryColor)),
          ),
        ],
      ),
    );
  }
}
