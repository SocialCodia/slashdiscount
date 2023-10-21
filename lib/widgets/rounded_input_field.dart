import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slashdiscount/controllers/widget_controller.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText,counter;
  final TextEditingController controller;
  final IconData icon;
  final TextInputType keyboardType;
  final bool isEnabled;
  final String? Function(String?) validator;
  RoundedInputField(
      {Key? key,
        required this.hintText,
        required this.controller,
        required this.icon,
        required this.validator,
        this.isEnabled = true,
        this.counter = '',
        this.keyboardType = TextInputType.text
      })
      : super(key: key);

  final WidgetController widgetController = Get.find<WidgetController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.85,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8)),
      child: TextFormField(
        keyboardType: keyboardType,
        validator:validator,
        controller: controller,
        enabled: !widgetController.isButtonProcessing.value || isEnabled,
        decoration: InputDecoration(
            hintText: hintText,
            labelText: hintText,
            counter: counter.isEmpty ? null : Text(counter),
            prefixIcon: Icon(icon),
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            border: const OutlineInputBorder()),
      ),
    );
  }
}