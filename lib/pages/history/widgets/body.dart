import 'package:flutter/material.dart';

import 'search.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const WidgetSearch(),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text("test")
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
