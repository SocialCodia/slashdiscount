import 'dart:convert';
import 'package:slashdiscount/models/vendor.dart';

ResponseVendors responseVendorsFromJson(String str) =>
    ResponseVendors.fromJson(jsonDecode(str));

class ResponseVendors {
  int? code, status;
  List<Vendor>? data;

  ResponseVendors({this.code, this.status, this.data});

  factory ResponseVendors.fromJson(Map<String, dynamic> json) =>
      ResponseVendors(
        code: json['code'],
        status: json['status'],
        data: json['Response'] == null
            ? null
            : List<Vendor>.from(
                json['Response'].map((x) => Vendor.fromJson(x))),
      );
}
