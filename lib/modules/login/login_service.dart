import 'package:beezar/config/server_config.dart';
import 'package:beezar/models/my_user.dart';
import 'package:http/http.dart' as http;

class LoginService {
  var url = Uri.parse(ServerConfig.DNS + ServerConfig.login);
  var message;
  var error;
  var token;

  Future<bool> login(User user) async {

    try {
      var response = await http.post(
        Uri.parse(url as String),
        headers: {
          'Accept': 'application/json',
        },
        body: {
          'email': 'user.email',
          'password':' user.password',
        },
      );
      print(response.statusCode);
      print(response.body);
    } catch (e) {
      print('$e + messageeeeeeeeeee');
    }
    // print(url);
    return true;

    // if (response.statusCode == 200) {
    //   var jsonResponse = jsonDecode(response.body);
    //   // message=jsonResponse['success'];
    //   return true;
    // } else if (response.statusCode == 422) {
    //   var jsonResponse = jsonDecode(response.body);
    //   //  message= jsonResponse['errors'];
    //   return false;
    // } else if (response.statusCode == 500) {
    //   var jsonResponse = jsonDecode(response.body);
    //   //  message= jsonResponse['errors'];
    //   return false;
    // } else {
    //   var jsonResponse = jsonDecode(response.body);
    //   // message= jsonResponse['errors'];
    //   return false;
    // }
  }
}