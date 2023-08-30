import 'package:beezar/components/custom_btn.dart';
import 'package:beezar/components/custom_textfeild1.dart';
import 'package:beezar/constants.dart';
import 'package:beezar/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../signup/signup_controller.dart';
import 'login_controller.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  LoginController loginController = LoginController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool passwordVisible = false;
  bool Issecure = true;

  var token;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                Center(
                  child: Text(
                    "مرحبًا بعودتك يرجى تسجيل الدخول الآن",
                    style: TextStyle(
                        color: itemColor,
                        fontSize: 15,
                        fontFamily: "ca1",
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.07,
                      left: MediaQuery.of(context).size.width * 0.01,
                      right: MediaQuery.of(context).size.width * 0.01),
                  child: FormFields(
                      "البريد الاليكتروني",
                      const Icon(Icons.email),
                      null,
                      false,
                      emailController, (value) {
                    loginController.email = value;
                  }),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.03,
                      left: MediaQuery.of(context).size.width * 0.01,
                      right: MediaQuery.of(context).size.width * 0.01),
                  child: FormFields(
                      "كلمة المرور",
                      const Icon(Icons.lock),
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
                      passwordController, (value) {
                    loginController.password = value;
                  }),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.01,
                    right: MediaQuery.of(context).size.width * 0.01,
                    top: MediaQuery.of(context).size.width * 0.03,
                  ),
                  child: Column(
                    children: [
                      CustomBtn(
                        onTapBtn: () {
                          if (formKey.currentState!.validate()) {
                            sharedPrefs?.setString('id', '$token');
                            sharedPrefs?.setString('email', emailController.text );
                            loginOnclick();
                          }
                        },
                        btnText: 'تأكيد',
                        btnBgColor: mainColor,
                        btnTxtColor: Colors.white,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'او سجل الدخول بواسطة',
                        style: TextStyle(
                          fontFamily: 'ca1',
                          color: Colors.black,
                        ),
                      ),
                      faceBtn(onTapBtn: () {
                        Get.offNamed('/fb');
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  loginOnclick() async {
    await loginController.LoginOnClick();
    if (loginController.LoginStatuse == true) {
      await EasyLoading.showSuccess('Register Successfully');
      Get.offNamed('/home');
    } else {
      EasyLoading.showError(loginController.message);
      print(loginController.message);
    }
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('AccessToken', AccessToken));
  }
}
