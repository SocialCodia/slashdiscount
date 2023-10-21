
import 'package:slashdiscount/pojos/response_user.dart';

import '../utils/api_methods.dart';
import 'api_service.dart';

class AuthService{

  static Future<ResponseUser> userLogin({mobile,otp}) async {
    final _response = await ApiService.postRequest({'method':ApiMethods.getLoginMethod,'mobile':mobile,'otp':otp});
    return responseUserFromJson(_response);
  }



}