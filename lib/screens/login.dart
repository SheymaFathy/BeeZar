import 'package:beezar/screens/signup.dart';
import 'package:flutter/material.dart';
import '../main.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/logoo.png'),
                    Text(
                      "تسجيل دخول",
                      style: TextStyle(
                          fontFamily: 'ca2',
                          color: mainColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    customTextFormFeild(
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        validate: (value) {
                          if (value.isEmpty) {
                            return ' الرجاء كتابة البريد الأليكتروني ';
                          }
                        },
                        label: 'البريد الأليكتروني',
                        prefix: Icons.email),
                    const SizedBox(
                      height: 20,
                    ),
                    customTextFormFeild(
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        validate: (value) {
                          if (value.isEmpty) {
                            return ' الرجاء كتابة كلمة المرور';
                          }
                        },
                        label: 'كلمة المرور',
                        suffix: Icons.remove_red_eye,
                        prefix: Icons.lock),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomBtn(
                        onTapBtn: () {
                          if (formKey.currentState!.validate()) {

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignupPage()));
                          }
                        },
                        btnText: 'تأكيــــد'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'ليس لديك حساب ؟',
                          style: TextStyle(fontSize: 15, fontFamily: 'ca2'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignupPage()));
                          },
                          child: const Text('سجل الآن',
                              style:
                              TextStyle(fontSize: 15, fontFamily: 'ca2')),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
}
