import 'package:get/get.dart';
import 'package:slashdiscount/utils/constants.dart';

class HomeController extends GetxController{

  var selectedCategoryName = Constants.defaultSelectedCategory.obs;

  List<String> categoryNames = ["Food","Health",'Shopping',"Grocery","Service","Sport","Education","Beauty & Salon"];
  List<String> categoryIcon = ["food.png","health.png","shopping.png","grocery.png","service.png","sport.png","education.png","beauty_salon.png"];

}