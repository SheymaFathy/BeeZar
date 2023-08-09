import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../models/my_user.dart';
import 'login_service.dart';

class LoginController extends GetxController {
  var keep = false;
  late String email;
  late String password;
  var LoginStatuse = false;
  var message;
  bool passwordVisible = false;
  bool Issecure = true;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  LoginService loginService = LoginService();

  Future<void> LoginOnClick() async {
    var responce = await loginService.login((User(
      email: email,
      password: password,
    ))).then((value) {
      if (value) {
        Get.toNamed('/home');
      } else {
        Get.showSnackbar(const GetSnackBar(
          title: "برجاء العلم حدثت مشكله بتسجيل الدخول",
        ));
      }
    });
    print(responce.toString());
    //  message = service.error;

    if (message is List) {
      String temp = '';
      for (String s in message) {
        temp += s + '\n';
        message = temp;
      }
    }
  }

  void changeState() {
    Issecure = !Issecure;
    passwordVisible = !passwordVisible;
    update();
  }
}
