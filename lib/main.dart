import 'package:beezar/screens/login.dart';
import 'package:flutter/material.dart';

Color mainColor = const Color.fromRGBO(13, 6, 88, 0.8);
Color textColor = Colors.grey;
Color? bgColor = Colors.grey[300];
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
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(13, 6, 88, 0.8),),
        useMaterial3: true,
      ),
      home:  LogIn(),
    );
  }
}

