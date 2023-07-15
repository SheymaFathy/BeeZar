import 'package:beezar/screens/home%20view.dart';
import 'package:flutter/material.dart';

import 'generated/l10n.dart';

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
      locale: const Locale(
        'ar',
      ),
      localizationsDelegates: const [
        S.delegate,
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff5CB8FF)),
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}

