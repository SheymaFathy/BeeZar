import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:beezar/modules/Screens/start.dart';
import 'package:flutter/material.dart';

import 'chooseNb.dart';



class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:FlutterSplashScreen(
          duration: const Duration(milliseconds: 5000),
          defaultNextScreen: const chooseNavicationBar(),
          backgroundColor: Colors.white,
          splashScreenBody: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                const Spacer(),
                SizedBox(
                  width: 300,
                  child: Image.asset('assets/images/splashh.gif'),
                ),
                const Spacer(),
                const Text(
                  "Developed by ©️ ARG Group Co.",
                  style: TextStyle(color:Color(0xff757575FF),fontWeight: FontWeight.bold, fontSize: 17),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        )
      )
    );
  }
}
