import 'package:beezar/screens/login.dart';
import 'package:flutter/material.dart';

Color mainColor = const Color(0xff5CB8FF);
Color textColor = Colors.black38;
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
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff5CB8FF)),
        useMaterial3: true,
      ),
      home:  LogIn(),
    );
  }
}

