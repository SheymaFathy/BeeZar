import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class faceBookLogin extends StatefulWidget {
  const faceBookLogin({super.key});

  @override
  State<faceBookLogin> createState() => _faceBookLoginState();
}

class _faceBookLoginState extends State<faceBookLogin> {
 bool _isLoggedIn = false;
 Map _userObj = {};

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child: Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: _isLoggedIn==true?Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_userObj["name"]),
            Text(_userObj["email"]),
            TextButton(onPressed: (){
              FacebookAuth.instance.logOut().then((value){
                setState(() {
                  _isLoggedIn = false;
                  _userObj = {};
                });
              });
            }, child: Text('تسجيل خروج'))
          ],
        ): Center(
          child: ElevatedButton(
            child: Text("تسجيل دخول بواسطة فيس بوك"),
            onPressed: ()async{
              FacebookAuth.instance.login(
                permissions: ["public_profile", "email"]
              ).then((value){
                FacebookAuth.instance.getUserData().then((userData)async{
                  setState(() {
                    _isLoggedIn = true;
                    _userObj = userData;
                  });
                });
              });
            },
          )
        ),
      ),
    ));
  }
}
