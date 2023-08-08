import 'package:get/get.dart';

import '../../models/my_user.dart';
import '../signup/signup_controller.dart';
import 'login_service.dart';


LogInService service = LogInService();

class logInController extends GetxController{
  var email;
  var password;
  var LogInStatuse =false;
  var message;


Future<void>LogInOnClick()async{
  User user = User( email: email, password: password, );

  LogInStatuse =await service.signin(user);
  //  message = service.error;

}
}