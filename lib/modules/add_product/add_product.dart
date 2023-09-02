// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types, must_be_immutable

import 'package:beezar/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/custom_btn.dart';
import 'add_product_conttroller.dart';

class addProduct extends StatelessWidget {
  final controller = Get.put(addProductController());

  addProduct({super.key});
  List<String> imgs = [
    'assets/images/logo.png',
    'assets/images/logo.png',
    'assets/images/logo.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [
          _row1(),
          _textField1('بحث', controller.textController[0]),
          _container1(),
          _padding1(),

          _textField2('اسم المنتج', controller.textController[1], 1),
          _textField2('سعر المنتج', controller.textController[2], 1),
          _textField2('عنوان المنتج', controller.textController[3], 1),
          _textField2('نوع المنتج', controller.textController[4], 1),
          _textField2('وصف المنتج', controller.textController[5], 2),
          // _padding2(),
          CustomBtn(
            btnText: 'نشر الاعلان',
            onTapBtn: () {}, btnBgColor: mainColor, btnTxtColor: Colors.white,
          ),
        ]),
      )),
    );
  }

  Padding _padding2() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      child: SizedBox(
          width: 200,
          height: 50,
          child: ElevatedButton(
              onPressed: () {
                print(controller.textController[0].text);
                print(controller.textController[1].text);
                print(controller.textController[2].text);
                print(controller.textController[3].text);
                print(controller.textController[4].text);
                print(controller.textController[5].text);
              },
              child: Text('نشر الاعلان',
                  style: TextStyle(color: Colors.red.shade300)))),
    );
  }

  Padding _padding1() {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0, bottom: 10),
      child: Align(
          alignment: Alignment.topRight,
          // left: 10,
          // right: 1000,
          child: SizedBox(
              // height: 100,
              width: 120,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('تحميل صوره',
                    style: TextStyle(color: Colors.red.shade300)),
              ))),
    );
  }

  Container _container1() {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.red.shade100),
        borderRadius: BorderRadius.circular(30),
      ),
      // width: 150,
      height: 150,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: imgs.length,
          itemBuilder: (BuildContext ctx, int index) {
            return Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                width: 150,
                height: 150,
                child: Image.asset(fit: BoxFit.cover, imgs[index]));
          }),
    );
  }

  _textField1(String hint, TextEditingController controller) {
    return SizedBox(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8, right: 25, left: 25),
        child: TextField(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide.none),
            hintStyle: TextStyle(color: Colors.grey),
            hintText: hint,
            filled: true,
            fillColor: Colors.grey[300],
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
          ),
          controller: controller,
        ),
      ),
    );
  }

  _textField2(String hint, TextEditingController controller, int max) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        maxLines: max,
        decoration: InputDecoration(
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(40)),

          hintStyle: TextStyle(color: Colors.grey),
          hintText: hint, hintTextDirection: TextDirection.rtl,
          filled: true,
          fillColor: Colors.grey[100],
          // prefixIcon: Icon(Icons.search),
          border: InputBorder.none,
        ),
        controller: controller,
      ),
    );
  }

  Row _row1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.abc_outlined,
              size: 50,
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.image,
              size: 50,
            ))
      ],
    );
  }
}
