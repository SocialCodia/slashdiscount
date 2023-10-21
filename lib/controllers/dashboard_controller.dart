import 'package:get/get.dart';
import 'package:slashdiscount/pages/history/history.dart';
import 'package:slashdiscount/pages/home/home.dart';
import 'package:slashdiscount/pages/offer/offer.dart';
import 'package:slashdiscount/pages/profile/profile.dart';
import 'package:slashdiscount/pages/stores/store.dart';

class DashboardController extends GetxController{

   var screenNumber = 0.obs;

   final screens = [HomePage(),StorePage(),OfferPage(),ProfilePage()];

}