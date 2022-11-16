import 'dart:convert';

import '../models/user.dart';

ResponseUser responseUserFromJson(String str) =>
    ResponseUser.fromJson(jsonDecode(str));

class ResponseUser {
  int? code, status;
  List<User>? data;

  ResponseUser({this.code, this.status, this.data});

  factory ResponseUser.fromJson(Map<String, dynamic> json) => ResponseUser(
      code: json['code'],
      status: json['status'],
      data: json['Response'] == null
          ? null
          : List<User>.from(json['Response'].map((x) => User.fromJson(x))));
}
