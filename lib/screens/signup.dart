import 'package:flutter/material.dart';
import '../main.dart';
import '../widgets/customContainer.dart';
import '../widgets/custom_btn.dart';
import '../widgets/custom_textFeild.dart';
import 'login.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var emailController = TextEditingController();
  var nameController = TextEditingController();
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
                              "انشاء حساب جديد",
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
                              "مرحبًا بك يرجى تسجيل بياناتك الآن",
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
                            child: FormFields("الاسم", Icon(Icons.person), null,
                                false, nameController),
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
                              top: MediaQuery.of(context).size.width * 0.07,
                              left: MediaQuery.of(context).size.width * 0.07,
                              right: MediaQuery.of(context).size.width * 0.07,
                            ),
                            child: CustomBtn(
                              onTapBtn: () {
                                if (formKey.currentState!.validate()) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LogIn()));
                                }
                              },
                              btnText: 'تأكيد',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.07,
                              right: MediaQuery.of(context).size.width * 0.09,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  ' لديك حساب بالفعل ؟',
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
                                                const LogIn()));
                                  },
                                  child: Text('سجل دخول الآن',
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
