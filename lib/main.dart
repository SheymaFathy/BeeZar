import 'package:beezar/Middleware/AuthMiddleware.dart';
import 'package:beezar/constants.dart';
import 'package:beezar/start.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'modules/Screens/homePage.dart';
import 'modules/login/login.dart';
import 'modules/signup/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedPrefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPrefs = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: mainColor,
      ),
      initialRoute: '/start',
      getPages: [
        GetPage(
            name: '/start',
            page: () => StartPage(),
            middlewares: [AuthMiddleware()]),
        GetPage(name: '/home', page: () =>  homePage()),
        GetPage(name: '/login', page: () => LogIn()),
        GetPage(name: '/signup', page: () => SignupPage()),
      ],
      builder: EasyLoading.init(),
    );
  }
}
