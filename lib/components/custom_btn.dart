import 'package:flutter/material.dart';

import '../constants.dart';
import '../main.dart';

// ignore: must_be_immutable
class CustomBtn extends StatelessWidget {
  CustomBtn({
    required this.onTapBtn,
    required this.btnText,
    required this.btnBgColor,
    required this.btnTxtColor,

  });

  VoidCallback onTapBtn;
  String btnText;
  Color btnBgColor;
  Color  btnTxtColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery
              .of(context)
              .size
              .width * 0.05,
          left: MediaQuery
              .of(context)
              .size
              .width * 0.03,
          right: MediaQuery
              .of(context)
              .size
              .width * 0.03),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          color: btnBgColor,
          border: Border()),
        child: MaterialButton(
          onPressed: onTapBtn,
          child: Text(
            btnText,
            style:  TextStyle(
                color: btnTxtColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'ca1'),
          ),
        ),
      ),
    );
  }
}

class faceBtn extends StatelessWidget {
  faceBtn({
    required this.onTapBtn,


  });

  VoidCallback onTapBtn;


  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child: Padding(
      padding: EdgeInsets.only(
          top: MediaQuery
              .of(context)
              .size
              .width * 0.03,
          left: MediaQuery
              .of(context)
              .size
              .width * 0.03,
          right: MediaQuery
              .of(context)
              .size
              .width * 0.03),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color(0xff1a6ed8),
            border: Border()),
        child: MaterialButton(
          onPressed: onTapBtn,
          child: Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "فيــــسبـــوك",
                style:  TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'ca1'),
              ),
              Icon(Icons.facebook, color: Colors.white,size: 25,)
            ],
          ),
        ),
      ),
    ),
    );
  }
}
