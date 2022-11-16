
import 'package:get/get.dart';
import 'package:slashdiscount/controllers/auth_controller.dart';
import 'package:slashdiscount/controllers/dashboard_controller.dart';
import 'package:slashdiscount/controllers/home_controller.dart';
import 'package:slashdiscount/controllers/slider_controller.dart';
import 'package:slashdiscount/controllers/user_controller.dart';
import 'package:slashdiscount/controllers/vendor_controller.dart';
import 'package:slashdiscount/controllers/widget_controller.dart';

class GlobalBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController(), fenix: true);
    Get.lazyPut(() => SliderController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => VendorController(), fenix: true);
    Get.lazyPut(() => WidgetController(), fenix: true);
    Get.lazyPut(() => AuthController(), fenix: true);
    Get.lazyPut(() => UserController(), fenix: true);
  }
  
}