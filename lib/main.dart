import 'package:beezar/Middleware/AuthMiddleware.dart';
import 'package:beezar/constants.dart';
import 'package:beezar/modules/Screens/start.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'modules/Screens/items/ItemDetail.dart';
import 'modules/Screens/items/items.dart';
import 'modules/Screens/splashScreen.dart';
import 'modules/Screens/subCategory/sub_category.dart';
import 'modules/Screens/chooseNb.dart';
import 'modules/Screens/category/category.dart';
import 'modules/login/facebook_login.dart';
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
      initialRoute: '/splash',
      getPages: [
        GetPage(
            name: '/start', page: () => StartPage(),
            middlewares: [AuthMiddleware()]),
        GetPage(name: '/choose', page: ()=> chooseNavicationBar()),
        GetPage(name: '/home', page: () =>  homePage()),
        GetPage(name: '/login', page: () => LogIn()),
        GetPage(name: '/signup', page: () => SignupPage()),
        GetPage(name: '/subcateg', page: () => SubCategoryScreen(id: 'id')),
        GetPage(name: '/items', page: () => showItems()),
        GetPage(name: '/detail', page: () => ItemDetail()),
        GetPage(name: '/fb', page: ()=> faceBookLogin()),
        GetPage(name: '/splash', page: ()=> Splash()),

      ],
      builder: EasyLoading.init(),
    );
  }
}
