import 'package:flutter/material.dart';

import '../main.dart';

// ignore: must_be_immutable
class CustomBtn extends StatelessWidget {
  CustomBtn({
    required this.onTapBtn,
    required this.btnText,
    super.key,
  });

  VoidCallback onTapBtn;
  String btnText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Color.fromRGBO(13, 6, 88, 0.8),),
        child: MaterialButton(
          onPressed: onTapBtn,
          child: Text(
            btnText,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'ca1'),
          ),
        ),
      ),
    );
  }
}
