import 'dart:convert';

import 'package:slashdiscount/models/slider.dart';

ResponseSliders responseSlidersFromJson(String str) => ResponseSliders.fromJson(jsonDecode(str));

class ResponseSliders {
  int? code, status;
  List<Slider>? data;

  ResponseSliders({this.code, this.status, this.data});

  factory ResponseSliders.fromJson(Map<String, dynamic> json) =>
      ResponseSliders(
        code: json['code'],
        status: json['status'],
        data: json['Response'] == null
            ? null
            : List<Slider>.from(
                json['Response'].map((x) => Slider.fromJson(x))),
      );
}
