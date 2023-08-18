import 'package:beezar/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class addPage extends StatefulWidget {
  const addPage({super.key, required this.title});
  final String title;

  @override
  State<addPage> createState() => _addPageState();
}

class _addPageState extends State<addPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: mainColor,
            title: const Text('إضافة إعلان'),
            centerTitle: true,
          ),
          body: Center(
            child: ListView(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  // child: GridView.builder(
                  //   itemCount: item.length,
                  //   itemBuilder: (BuildContext context, int index) {
                  //     return Image.file(file(imageFileList[index].path),
                  //         fit: BoxFit.cover);
                  //   },
                  //   gridDelegate:
                  //       const SliverGridDelegateWithFixedCrossAxisCount(
                  //     crossAxisCount: 3,
                  //   ),
                  // ),
                ))
              ],
            ),
          ),
        ));
  }
}
