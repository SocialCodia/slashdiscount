import 'package:flutter/material.dart';
import '../../widgets/drawers/drawer.dart';
import 'widgets/body.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      drawer:  MyDrawer(),
      body: Body(),
    );
  }
}
