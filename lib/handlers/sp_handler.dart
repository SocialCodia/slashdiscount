
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';
import '../utils/constants.dart';

class SpHandler{

  static late final SharedPreferences instance;

  static Future<SharedPreferences> init() async =>
    instance = await SharedPreferences.getInstance();

  static saveUser(User user) {
    instance.setString(Constants.userId, user.id.toString());
    instance.setString(Constants.userNumber, user.number.toString());
    instance.setString(Constants.userName, user.name.toString());
    instance.setString(Constants.userEmail, user.email.toString());
    instance.setString(Constants.userMobile, user.mobile.toString());
    instance.setString(Constants.userGender, user.gender.toString());
    instance.setString(Constants.userDob, user.dob.toString());
    instance.setString(Constants.userAddress, user.address.toString());
    instance.setString(Constants.userType, user.type.toString());
    instance.setString(Constants.userPaidOrFree, user.paidOrFree.toString());
  }

  static  getUser()  => User(
      number: instance.getString(Constants.userNumber),
      id: instance.getString(Constants.userNumber),
      name: instance.getString(Constants.userName),
      mobile: instance.getString(Constants.userEmail),
      email: instance.getString(Constants.userMobile),
      gender: instance.getString(Constants.userGender),
      dob: instance.getString(Constants.userDob),
      address: instance.getString(Constants.userAddress),
      type: instance.getString(Constants.userType),
      paidOrFree: instance.getString(Constants.userPaidOrFree),
  );

  static logoutUser() async => await instance.clear();

  static String getUserName() => instance.getString(Constants.userName) ?? 'Guest';

  static String getUserEmail() => instance.getString(Constants.userEmail) ?? 'guest@example.com';

  static String getUserMobile() => instance.getString(Constants.userMobile) ?? '9867503256';

  static bool isLoggedIn() => instance.get(Constants.userNumber) != null;

}