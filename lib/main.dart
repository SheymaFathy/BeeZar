import 'package:beezar/screens/login.dart';
import 'package:beezar/screens/splashScreen.dart';
import 'package:flutter/material.dart';

Color mainColor = const Color(0xff5BC0BE);
Color? textColor = Colors.grey[600];
Color? subTitle = Colors.grey[500];
Color titleColor = Colors.black;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(13, 6, 88, 0.8),),
        useMaterial3: true,
      ),
      home:  LogIn(),
    );
  }
}

