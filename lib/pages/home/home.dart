import 'package:flutter/material.dart';
import 'package:slashdiscount/utils/constants.dart';
import 'package:slashdiscount/widgets/drawers/drawer.dart';
import 'widgets/body.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.appName),
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(child: Body()),
    );
  }
}
