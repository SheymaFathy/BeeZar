import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../config/server_config.dart';
import '../../models/my_user.dart';

class LogInService{
  var url = Uri.parse(ServerConfig.DNS+ServerConfig.login);
  // var url1 = Uri.parse(ServerConfig.DNS+ServerConfig.login);
  var message;
  var error;
  var token;


  Future<bool> signin(User user) async{
    print("Welcommmmmme");
    var response = await http.get(
      url,

      headers: {
        'password':user.password,
        'email': user.email,

      },
    );
    print(url);
    print(response.statusCode);
    print(response.body);


    if(response.statusCode==200){
      var jsonResponse=jsonDecode(response.body);
      print('hhhhhhhhhhhhhhhhhhhhhhh');
      // message=jsonResponse['success'];
      return true;

    }
    else if(response.statusCode==422){
      var jsonResponse=jsonDecode(response.body);
      //  message= jsonResponse['errors'];
      return false;
    }
    else if(response.statusCode==500){
      var jsonResponse=jsonDecode(response.body);
      //  message= jsonResponse['errors'];
      return false;
    }
    else{
      var jsonResponse=jsonDecode(response.body);
      // message= jsonResponse['errors'];
      return false;
    }
  }


}