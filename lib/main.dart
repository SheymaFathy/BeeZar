import 'package:beezar/constants.dart';
import 'package:beezar/start.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'modules/login/login.dart';
import 'modules/signup/signup.dart';

void main() async{
  runApp( MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
       primaryColor: mainColor,
      ),
      initialRoute: '/start',
      getPages:
      [
        GetPage(name: '/start', page: ()=>StartPage()),
        GetPage(name: '/login', page: ()=>LogIn()),
        GetPage(name: '/signup', page: ()=>SignupPage()),
      ],
      builder: EasyLoading.init(),
    );
  }

}
