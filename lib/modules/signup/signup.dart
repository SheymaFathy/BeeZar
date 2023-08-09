import 'package:beezar/components/custom_btn.dart';
import 'package:beezar/components/custom_textfeild1.dart';
import 'package:beezar/modules/login/login.dart';
import 'package:beezar/modules/signup/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class SignupPage extends StatefulWidget {



  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  SignUpController controller = SignUpController();
  var formKey = GlobalKey<FormState>();
  bool passwordVisible = false;
  bool Issecure = true;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body:  Center(
            child: Form(
              key: formKey,
              child: Stack(
                children: [

                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.01),
                    child: IntrinsicHeight(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Center(
                            child: Text(
                              "مرحبًا بك يرجى تسجيل بياناتك الآن",
                              style: TextStyle(
                                  color: itemColor,
                                  fontSize: 15,
                                  fontFamily: "ca1",
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.width * 0.02,
                                left: MediaQuery.of(context).size.width * 0.01,
                                right: MediaQuery.of(context).size.width * 0.01),
                            child: FormFields("الاسم", Icon(Icons.person, ), null,
                                false, nameController,
                                    (value){controller.name=value;}),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.width * 0.02,
                                left: MediaQuery.of(context).size.width * 0.01,
                                right: MediaQuery.of(context).size.width * 0.01
                            ),
                            child: FormFields(
                                "البريد الاليكتروني",
                                Icon(Icons.email,),
                                null,
                                false,
                                emailController,
                                    (value){controller.email=value;}),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.width * 0.02,
                                left: MediaQuery.of(context).size.width * 0.01,
                                right: MediaQuery.of(context).size.width * 0.01),
                            child: FormFields(
                                "كلمة المرور",
                                Icon(Icons.lock,),
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
                                passwordController,
                                    (value){controller.password=value;}),
                          ),

                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.width * 0.02,
                                left: MediaQuery.of(context).size.width * 0.01,
                                right: MediaQuery.of(context).size.width * 0.01),
                            child: FormFields(
                                "العنوان",
                                Icon(Icons.home),
                                null,
                                false,
                                addressController,
                                    (value){controller.address=value;}),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.width * 0.02,
                                left: MediaQuery.of(context).size.width * 0.01,
                                right: MediaQuery.of(context).size.width * 0.01),
                            child: FormFields(
                                "رقم الهاتف المحمول",
                                Icon(Icons.phone),
                                null,
                                false,
                                phoneController,
                                    (value){controller.phone=value;}),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.width * 0.02,
                              left: MediaQuery.of(context).size.width * 0.05,
                              right: MediaQuery.of(context).size.width * 0.05,
                            ),
                            child: CustomBtn(
                              onTapBtn: () {
                                registerOnclick();
                              },
                              btnText: 'تأكيد', btnBgColor: btnBglight, btnTxtColor: Colors.white,
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
      );

  }
  registerOnclick() async {

    await controller.SignOnClick();
    EasyLoading.show(status: "Loading..");
    if (controller.SignUpStatuse==true) {
      await EasyLoading.showSuccess('Register Successfully');
      Get.offNamed('/home');
    }
    else {
      EasyLoading.showError(controller.message);
      print(controller.message);
    }
  }
}

