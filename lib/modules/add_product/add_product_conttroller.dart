import 'package:flutter/material.dart';
import 'package:get/get.dart';

class addProductController extends GetxController {
  List<TextEditingController> textController =
      List.generate(6, (i) => TextEditingController());
}
