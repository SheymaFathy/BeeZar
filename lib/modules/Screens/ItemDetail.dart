import 'package:beezar/components/custom_btn.dart';
import 'package:beezar/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class ItemDetail extends StatefulWidget {
  @override
  State<ItemDetail> createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  Widget myHeader(){
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(
                  color: Colors.grey,
                  spreadRadius:1,
                  blurRadius: 2,
                  offset: Offset(0,2),
                )],
                borderRadius: BorderRadius.circular(15),
              ),
              child: IconButton(onPressed: (){
                Navigator.of(context).pop();
              }, icon: Icon(Icons.arrow_back, color: itemColor,))),
          Expanded(child: Text("")),
          //..............shop card
          Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(
                  color: Colors.grey,
                  spreadRadius:1,
                  blurRadius: 1,
                  offset: Offset(0,1),
                )],
                borderRadius: BorderRadius.circular(15),
              ),
              child: IconButton(onPressed: (){

              }, icon: Icon(Icons.favorite, color: itemColor,))),

        ],
      ),
    );
  }
  Widget mealImage(){
    return Container(

      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(
          spreadRadius: 2,
          blurRadius: 2,
          offset: Offset(0,2),
          color: Colors.grey,
        ),],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Column(
        children: [
          Image.asset('assets/images/cars.jpg'),
          Padding(padding: EdgeInsets.only(top: 10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('اسم المعلن',style: TextStyle(fontWeight: FontWeight.bold,color: textColor,fontSize: 15)),
              Text('201116966641+',style: TextStyle(fontWeight: FontWeight.bold,color: textColor,fontSize: 15)),
              Row(
                children: [
                  Text('القاهرة',style: TextStyle(fontWeight: FontWeight.bold,color: textColor,fontSize: 17)),
                  Icon(Icons.location_on_rounded,color: itemColor,),
                ],
              ),

              Container(
                decoration: BoxDecoration(
                  color: mainColor,
                  boxShadow: [BoxShadow(
                    color: Colors.grey,
                    spreadRadius:1,
                    blurRadius: 1,
                    offset: Offset(0,1),
                  )],
                  borderRadius: BorderRadius.circular(15),
                ),


                ),


            ],
          ),

        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child:Scaffold(
      backgroundColor: Colors.grey[50],
      body: Stack(
          children: [
            ListView(
              children: [

                mealImage(),

                Container(
                    padding: EdgeInsets.all(25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('نوع السيارة', style: TextStyle(fontSize: 30, fontFamily: 'ca1', fontWeight: FontWeight.bold, color: textColor),),
                        Row(
                          children: [
                            Icon(Icons.favorite,color: Colors.red,),
                            Text('  المفضلات', style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,fontFamily: 'ca1'),),
                            Expanded(child: Text(''),),
                            Icon(Icons.star, color: itemColor,size: 30,),
                            Text('  التقييم', style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,fontFamily: 'ca1'),),
                          ],
                        ),
                        Text('الوصف الكامل للمنتج الوصف الكامل للمنتج الوصف الكامل للمنتج الوصف الكامل للمنتج الوصف الكامل للمنتج الوصف الكامل للمنتج ',
                          style: TextStyle(fontSize: 16, fontFamily: 'ca1', color: textColor),),
                        Text('السعر',style: TextStyle(fontSize: 25, fontFamily: 'ca1', color: textColor), ),
                        Text('200000',style: TextStyle(fontSize: 25, fontFamily: 'ca1', color: textColor), )
                      ],
                    )),
                CustomBtn(onTapBtn: (){
                  Get.back();
                }, btnBgColor: mainColor,btnText: 'عودة للصفحة الرئيسية',btnTxtColor: Colors.white,),

              ],
            ),
            Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              height: 120.0,
              child: myHeader(),),
          ]
      ),

    ),

    );
  }
}
