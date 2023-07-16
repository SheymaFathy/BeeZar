import 'package:flutter/material.dart';
import '../main.dart';
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

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Image.asset('assets/images/logoo.png', width: 200,)),
                    Text(
                      "تسجيل مشترك جديد",
                      style: TextStyle(
                          fontFamily: 'ca2',
                          color: mainColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    customTextFormFeild(
                        controller: nameController,
                        type: TextInputType.emailAddress,
                        validate: (value) {
                          if (value.isEmpty) {
                            return ' الرجاء كتابة الإسم الثلاثي ';
                          }
                        },
                        label: 'الإسم الثلاثي',
                        prefix: Icons.person),
                    const SizedBox(
                      height: 20,
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
                        onTapBtn: ()  {

                        },
                        btnText: 'سجل الآن'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          ' لديك حساب بالفعل؟',
                          style: TextStyle(fontSize: 15, fontFamily: 'ca2'),
                        ),
                        TextButton(
                          onPressed: () {
                            if (formKey.currentState != null &&
                                formKey.currentState!.validate()) {}
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LogIn()));
                          },
                          child: const Text('سجل دخول الآن',
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
    ),
    );
  }
}
