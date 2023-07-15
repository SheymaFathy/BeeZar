import 'package:flutter/material.dart';

import '../main.dart';

Widget customTextFormFeild({
  required TextEditingController controller,
  required TextInputType type,
  required Function validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  bool isPassword = false,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      validator: (value) {
        return validate(value);
      },
      decoration: InputDecoration(

        labelText: label,
        labelStyle: const TextStyle(fontFamily: 'ca1'),
        suffixIcon: suffix != null
            ? Icon(
                suffix,
              )
            : null,
        prefixIcon: Icon(
          prefix,
          color: mainColor,
        ),
        border: const OutlineInputBorder(),


      ),
    );


