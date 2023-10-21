import 'package:flutter/material.dart';

import '../../widgets/drawers/drawer.dart';
import 'widgets/body.dart';

class OfferPage extends StatelessWidget {
  const OfferPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Offers"),
      ),
      drawer:  MyDrawer(),
      body: Body(),
    );
  }
}
