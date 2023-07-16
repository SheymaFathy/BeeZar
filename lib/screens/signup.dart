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
    return Directionality(textDirection: TextDirection.rtl, child: Scaffold(
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
                        child: Column(
                          children: [
                            Center(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top:
                                  MediaQuery.of(context).size.height * 0.08,
                                ),
                                child: Text(
                                  "إنشاء حساب ",
                                  style: TextStyle(
                                      color: Color.fromRGBO(13, 6, 88, 0.8),
                                      fontSize: 37,
                                      fontFamily: "ca1"),
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Center(
                              child: Text(
                                "مرحبًا بك .. يرجى تسجيل بياناتك الآن",
                                style: TextStyle(
                                    color: Colors.black87.withOpacity(0.47),
                                    fontSize: 13,
                                    fontFamily: "ca1",
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.035,
                                  left:
                                  MediaQuery.of(context).size.width * 0.07,
                                  right:
                                  MediaQuery.of(context).size.width * 0.07),
                              child: FormFields("الاسم", Icon(Icons.person),
                                  null, false, nameController),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.width * 0.03,
                                  left:
                                  MediaQuery.of(context).size.width * 0.07,
                                  right:
                                  MediaQuery.of(context).size.width * 0.07),
                              child: FormFields(
                                  "البريد الاليكتروني",
                                  Icon(Icons.email),
                                  null,
                                  false,
                                  emailController),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.width * 0.03,
                                  left:
                                  MediaQuery.of(context).size.width * 0.07,
                                  right:
                                  MediaQuery.of(context).size.width * 0.07),
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
                                  top: MediaQuery.of(context).size.width * 0.1,
                                  left:
                                  MediaQuery.of(context).size.width * 0.15,
                                  right:
                                  MediaQuery.of(context).size.width * 0.15,
                                  bottom: MediaQuery.of(context).size.width *
                                      0.001),
                              child: CustomBtn(onTapBtn: () {
                                if (formKey.currentState!.validate()) {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) =>   LogIn()));
                                }
                              }, btnText: 'تأكيد',)
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
                                      0.10,
                                  bottom:
                                  MediaQuery.of(context).size.width *
                                      0.01),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    ' لديك حساب  ؟',
                                    style: TextStyle(fontSize: 15, fontFamily: 'ca2'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => const LogIn()));
                                    },
                                    child: const Text(' سجل دخول الآن',
                                        style:
                                        TextStyle(fontSize: 15, fontFamily: 'ca2')),
                                  )
                                ],
                              ),
                            )
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
