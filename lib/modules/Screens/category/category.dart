import 'dart:convert';
import 'package:beezar/constants.dart';
import 'package:beezar/models/subCategory_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../config/server_config.dart';
import '../../Drawer/drawer.dart';
import 'package:http/http.dart' as http;

import '../subCategory/sub_category.dart';

class homePage extends StatefulWidget {
   homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
   TextEditingController srch = TextEditingController();

   var myArray_categ = [
     {
       "cat_id": "1",
       "cat_name": "عقارات",
       "cat_image": "assets/images/build1.jpeg",
     },
     {
       "cat_id": "2",
       "cat_name": "سيارات",
       "cat_image": "assets/images/cars.jpg",
     },
     {
       "cat_id": "3",
       "cat_name": "حيوانات أليفة",
       "cat_image": "assets/images/pets.jpg",
     },
     {
       "cat_id": "4",
       "cat_name": "أليكترونيات",
       "cat_image":"assets/images/lap.jpg",
     },
   ];



  @override
  Widget build(BuildContext context) {
    return  Directionality(textDirection: TextDirection.rtl, child: Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Padding(
          padding:  EdgeInsets.only(right:1.0),
          child: Container(
            height: 40,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextFormField(
              controller: srch,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color:Colors.black,
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                  ),
                  label: Text(
                    'بحث',
                    style: TextStyle(
                        fontSize: 16,
                        color: textColor,
                        fontFamily: 'reg'),
                  )),
            ),
          ),
        ),
        centerTitle: true,

      ),
      drawer:Drawerr(),
      body:  Stack(
          children: [
            FutureBuilder(
              future: http.get(Uri.parse(ServerConfig.DNS + ServerConfig.category)),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data  != null) {
                  dynamic data = json.decode(snapshot.data.body);
                  return GridView.builder(
                    itemCount: data.length,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 30,
                        child: ListView(
                            children: [
                              Center(
                                  child:Text(data[index]["name"],
                                    style: TextStyle(color: textColor, fontWeight: FontWeight.w900, fontSize: 20,fontFamily: 'ca1'),)),
                              SizedBox(height: 10,),
                              ClipRRect(
                                child:
                                GestureDetector(
                                  child: Container(
                                      width: 200,
                                      height: 150,
                                      child: Image.asset([index].toString())),
                                  onTap:  (){
                                    Navigator.push(context, MaterialPageRoute(builder: (contets) => SubCategoryScreen(
                                        id:"${data[index]["id"]}",
                                    )));
                                  },
                                ),
                              ),
                            ]

                        ),
                      );
                    },
                    padding: EdgeInsets.all(5.0),
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                  );

                } else {
                  return Text("No Connection");
                }
              },
            ),
          ]
      ),
    ));
  }
}
class SingleCategory extends StatelessWidget {
  final String cat_id;
  final String cat_name;
  final String cat_image;

  SingleCategory(
      {required this.cat_id, required this.cat_name, required this.cat_image});

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.width * 0.02,
          left: MediaQuery.of(context).size.width * 0.01,
          right: MediaQuery.of(context).size.width * 0.01,
          bottom: MediaQuery.of(context).size.width *0.01
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Get.offNamed('/subcateg');
            },
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3.0,

                  )
                ],
                borderRadius: BorderRadius.circular(15),
                color: Colors.teal[50],
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(cat_image),
                ),
              ),
            ),
          ),
            SizedBox(height: 2,),
          Text(
            cat_name,
            style: TextStyle(fontFamily: 'ca1', fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

