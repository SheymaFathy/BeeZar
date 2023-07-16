import 'package:beezar/main.dart';
import 'package:beezar/screens/signup.dart';
import 'package:flutter/material.dart';
import '../widgets/customContainer.dart';
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
        backgroundColor: bgColor,
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.20),
                  child: CustomedContainer(
                      100,
                      0,
                      0.80,
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.7,
                          child: ListView(children: [
                            Column(
                              children: [
                                Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.08,
                                    ),
                                    child: Text(
                                      "تسجيل دخول",
                                      style: TextStyle(
                                          color: Color.fromRGBO(13, 6, 88, 0.8),
                                          fontSize: 37,
                                          fontFamily: "ca1"),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: Text(
                                    "مرحبًا بعودتك يرجى تسجيل الدخول",
                                    style: TextStyle(
                                        color: Colors.black87.withOpacity(0.47),
                                        fontSize: 13,
                                        fontFamily: "ca1",
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.width *
                                          0.03,
                                      left: MediaQuery.of(context).size.width *
                                          0.07,
                                      right: MediaQuery.of(context).size.width *
                                          0.07),
                                  child: FormFields(
                                      "البريد الاليكتروني",
                                      Icon(Icons.email),
                                      null,
                                      false,
                                      emailController),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.width *
                                          0.03,
                                      left: MediaQuery.of(context).size.width *
                                          0.07,
                                      right: MediaQuery.of(context).size.width *
                                          0.07),
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
                                        top: MediaQuery.of(context).size.width *
                                            0.1,
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.15,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.15,
                                        bottom:
                                            MediaQuery.of(context).size.width *
                                                0.001),
                                    child: CustomBtn(
                                      onTapBtn: () {
                                        if (formKey.currentState!.validate()) {
                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (context) =>   SignupPage()));
                                        }
                                      },
                                      btnText: 'تأكيد',
                                    ),

                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.width *
                                          0.1,
                                      left:
                                      MediaQuery.of(context).size.width *
                                          0.15,
                                      right:
                                      MediaQuery.of(context).size.width *
                                          0.15,
                                      bottom:
                                      MediaQuery.of(context).size.width *
                                          0.001),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'ليس لديك حساب ؟',
                                        style: TextStyle(fontSize: 15, fontFamily: 'ca2'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (context) => const SignupPage()));
                                        },
                                        child: const Text('سجل الآن',
                                            style:
                                            TextStyle(fontSize: 15, fontFamily: 'ca2')),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                          ),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
