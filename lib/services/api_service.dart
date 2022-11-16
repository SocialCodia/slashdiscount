import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:slashdiscount/utils/constants.dart';

class ApiService{

  static final _client = http.Client();

  static Map<String,String> get _getRequestHeader => {
    'Accept':'application/json'
  };
  // static Future<String> getRequest()


  static Future<String> postRequest(body) async {
    Uri uri = Uri.parse(Constants.apiUrl);
    print("========================REQUEST BODY IS "+body.toString());
    final _res = await http.post(uri,body: jsonEncode(body),headers: _getRequestHeader);
    print("========================RESPONSE  IS "+_res.body.toString());
    return _res.body.toString();
  }

}