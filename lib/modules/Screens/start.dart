import 'package:beezar/components/custom_btn.dart';
import 'package:beezar/constants.dart';
import 'package:beezar/modules/login/login.dart';
import 'package:beezar/modules/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.width * 0.30,
                left: MediaQuery.of(context).size.width * 0.03,
                right: MediaQuery.of(context).size.width * 0.03),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/lg.png"),
                Expanded(
                    child: Column(
                  children: [
                    Text(
                      'مرحباً بك ',
                      style: TextStyle(
                          fontSize: 30,
                          color: mainColor,
                          fontFamily: 'ca1',
                          fontWeight: FontWeight.bold),
                    ),
                    Center(
                        child: Text(
                      'يرجى تسجيل الدخول أو ادخال بياناتك للاشتراك ',
                      style: TextStyle(
                          fontSize: 16, color: titleColor, fontFamily: 'ca1'),
                    )),
                  ],
                )),
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomBtn(
                        onTapBtn: () {
                          _signUpBottonSheet(context);
                        },
                        btnText: ('اشترك الآن '),
                        btnBgColor: mainColor,
                        btnTxtColor: Colors.white,
                      ),
                      CustomBtn(
                        onTapBtn: () {
                          _logInBottonSheet(context);
                        },
                        btnText: (' تسجيل دخول'),
                        btnBgColor: mainColor,
                        btnTxtColor: Colors.white,
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
        ));
  }
}

Future _signUpBottonSheet(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(30),
      )),
      builder: (context) => SizedBox(
            height: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * 0.09,
                  left: MediaQuery.of(context).size.width * 0.02,
                  right: MediaQuery.of(context).size.width * 0.02),
              child: SignupPage(),
            ),
          ));
}

Future _logInBottonSheet(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(30),
      )),
      builder: (context) => SizedBox(
            height: 800,
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * 0.09,
                  left: MediaQuery.of(context).size.width * 0.02,
                  right: MediaQuery.of(context).size.width * 0.02
              ),
              child: LogIn(),
            ),
          ));
}
