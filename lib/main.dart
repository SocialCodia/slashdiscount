import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slashdiscount/bindings/global_binding.dart';
import 'package:slashdiscount/handlers/sp_handler.dart';
import 'package:slashdiscount/styles/colors.dart';
import 'routes/routes.dart';
import 'package:google_fonts/google_fonts.dart';

int? onBoardingScreen;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpHandler.init();
  onBoardingScreen = SpHandler.instance.getInt("onBoardingScreen");
  await SpHandler.instance.setInt("onBoardingScreen",1);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: MyColor.primaryColor,
          centerTitle: true,
        )
      ),
      initialBinding: GlobalBinding(),
      initialRoute: onBoardingScreen==null || onBoardingScreen==0 ?  Routes.boardingRoute : Routes.splashRoute,
      getPages: Routes.routes,

        builder:(context,child){
          final mediaQueryData = MediaQuery.of(context);
          final scale = mediaQueryData.textScaleFactor.clamp(0.7, 0.7);
          return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: scale), child: child!);
        }
    );
  }
}
