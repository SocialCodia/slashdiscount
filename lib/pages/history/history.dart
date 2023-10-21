import 'package:flutter/material.dart';

import '../../widgets/drawers/drawer.dart';
import 'widgets/body.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History Page"),
      ),
      drawer:  MyDrawer(),
      body: Body(),
    );
  }
}
