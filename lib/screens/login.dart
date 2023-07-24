import 'package:beezar/main.dart';
import 'package:beezar/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import '../widgets/custom_btn.dart';
import '../widgets/custom_textFeild.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool passwordVisible = false;
  bool Issecure = true;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Colors.white,
                  mainColor,
                ]),
          ),
          child: Center(
            child: Form(
              key: formKey,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.05,
                        left: MediaQuery.of(context).size.width * 0.07,
                        right: MediaQuery.of(context).size.width * 0.1),
                    child: Image.asset(
                      'assets/images/logo1.png',
                      width: 300,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.25),
                    child: Container(
                      height: double.infinity,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Center(
                            child: Text(
                              "تسجيل دخول",
                              style: TextStyle(
                                  color: textColor,
                                  fontSize: 37,
                                  fontFamily: "ca1"),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              "مرحبًا بعودتك يرجى تسجيل الدخول الآن",
                              style: TextStyle(
                                  color: Colors.black87.withOpacity(0.47),
                                  fontSize: 13,
                                  fontFamily: "ca1",
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.width * 0.07,
                                left: MediaQuery.of(context).size.width * 0.07,
                                right: MediaQuery.of(context).size.width * 0.07),
                            child: FormFields(
                                "البريد الاليكتروني",
                                Icon(Icons.email),
                                null,
                                false,
                                emailController),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.width * 0.07,
                                left: MediaQuery.of(context).size.width * 0.07,
                                right: MediaQuery.of(context).size.width * 0.07),
                            child: FormFields(
                                "كلمة المرور",
                                Icon(Icons.lock),
                                IconButton(
                                  icon: Icon(
                                    passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      Issecure = !Issecure;
                                      passwordVisible = !passwordVisible;
                                    });
                                  },
                                ),
                                Issecure,
                                passwordController),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.07,
                                right: MediaQuery.of(context).size.width * 0.07),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'نسيت كلمة المرور ؟',
                                      style: TextStyle(
                                        fontFamily: 'ca1',
                                        fontWeight: FontWeight.bold,
                                        color: textColor,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.07,
                              right: MediaQuery.of(context).size.width * 0.07,
                            ),
                            child: CustomBtn(
                              onTapBtn: () {
                                if (formKey.currentState!.validate()) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignupPage()));
                                }
                              },
                              btnText: 'تأكيد',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.07,
                              right: MediaQuery.of(context).size.width * 0.07,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'ليس لديك حساب ؟',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'ca2',
                                      color: textColor),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SignupPage()));
                                  },
                                  child: Text('سجل الآن',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'ca2',
                                          color: textColor)),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
