
import 'package:get/get.dart';
import 'package:slashdiscount/pages/dashboard/dashboard.dart';
import 'package:slashdiscount/pages/history/history.dart';
import 'package:slashdiscount/pages/home/home.dart';
import 'package:slashdiscount/pages/login/login.dart';
import 'package:slashdiscount/pages/offer/offer.dart';
import 'package:slashdiscount/pages/onboarding/on_boarding.dart';
import 'package:slashdiscount/pages/payment/payment.dart';
import 'package:slashdiscount/pages/splash/splash.dart';
import 'package:slashdiscount/pages/stores/store.dart';

import '../pages/scanner/scanner.dart';

class Routes{
  static String boardingRoute = '/boarding';
  static String splashRoute = '/';
  static String loginRoute = '/login';
  static String dashboardRoute = '/dashboard';
  static String homeRoute = '/home';
  static String storeRoute = '/stores';
  static String historyRoute = '/history';
  static String offerRoute = '/offer';
  static String scannerRoute = '/scanner';
  static String paymentRoute = '/scanner';


  static final routes = [
    GetPage(name: boardingRoute, page: ()=> OnBoardingPage()),
    GetPage(name: splashRoute, page: ()=> const SplashPage()),
    GetPage(name: loginRoute, page: ()=> LoginPage()),
    GetPage(name: dashboardRoute, page: ()=> DashboardPage()),
    GetPage(name: homeRoute, page: ()=> HomePage()),
    GetPage(name: storeRoute, page: ()=> StorePage()),
    GetPage(name: historyRoute, page: ()=> const HistoryPage()),
    GetPage(name: offerRoute, page: ()=> const OfferPage()),
    GetPage(name: scannerRoute, page: ()=> ScannerPage()),
    GetPage(name: paymentRoute, page: ()=> PaymentPage()),
  ];

}