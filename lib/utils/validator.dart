
import 'package:get/get_utils/src/get_utils/get_utils.dart';

class Validator{

  static String? verifyOtp(String? value)
  {
    return value!.isEmpty ? 'Enter OTP' : value.length!=6 ? 'Invalid OTP' : null;
  }

  static String? validateName(String? value)
  {
    return value!.isEmpty ? 'Enter Name' : value.length<4 ? 'Name too Short' : value.length > 30 ? 'Name too Long' : null;
  }

  static String? validateMobile(String? value)
  {
    return value!.isEmpty ? 'Enter Mobile Number' : value.length !=10 ? 'Invalid Mobile Number' : value.length > 13 ? 'Invalid Mobile Number' : null;
  }


  static String? validateEmail(String? value)
  {
    return value!.isEmpty? 'Enter Email' : !GetUtils.isEmail(value) ? 'Enter Valid Email' : null;
  }

}