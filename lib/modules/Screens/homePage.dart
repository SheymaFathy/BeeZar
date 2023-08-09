import 'package:beezar/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Drawer/drawer.dart';

class homePage extends StatelessWidget {
   homePage({super.key});
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
   var myArray_products = [
     {
       "pro_id": "1",
       "pro_name": "شقة للبيع",
       "pro_dec": "شقة للبيع في الدور الخامس ....",
       "pro_img": "assets/images/building.jpeg",
     },
     {
       "pro_id": "1",
       "pro_name": "شقة للبيع",
       "pro_dec": "شقة للبيع في الدور الخامس ....",
       "pro_img": "assets/images/building.jpeg",
     },
     {
       "pro_id": "1",
       "pro_name": "شقة للبيع",
       "pro_dec": "شقة للبيع في الدور الخامس ....",
       "pro_img": "assets/images/building.jpeg",
     },
     {
       "pro_id": "1",
       "pro_name": "شقة للبيع",
       "pro_dec": "شقة للبيع في الدور الخامس ....",
       "pro_img": "assets/images/building.jpeg",
     },
     {
       "pro_id": "1",
       "pro_name": "شقة للبيع",
       "pro_dec": "شقة للبيع في الدور الخامس ....",
       "pro_img": "assets/images/building.jpeg",
     },
     {
       "pro_id": "1",
       "pro_name": "شقة للبيع",
       "pro_dec": "شقة للبيع في الدور الخامس ....",
       "pro_img": "assets/images/building.jpeg",
     },
     {
       "pro_id": "1",
       "pro_name": "شقة للبيع",
       "pro_dec": "شقة للبيع في الدور الخامس ....",
       "pro_img": "assets/images/building.jpeg",
     },


   ];

  @override
  Widget build(BuildContext context) {
    return  Directionality(textDirection: TextDirection.rtl, child: Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text('الصفحة الرئيسية', style: TextStyle(fontFamily: 'ca1', fontSize: 25),),
        centerTitle: true,

      ),
      drawer:Drawerr(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding:  EdgeInsets.only(right: 5.0),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextFormField(
                            controller: srch,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white54,
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
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: 140,
                child: ListView.builder(
                    itemCount: myArray_categ.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return SingleCategory(
                          cat_id: myArray_categ[index]["cat_id"].toString(),
                          cat_image:
                          myArray_categ[index]["cat_image"].toString(),
                          cat_name:
                          myArray_categ[index]["cat_name"].toString());
                    }),
              ),
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: 400,
                child: ListView.builder(
                    itemCount: myArray_products.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return SingleProduct(
                        pro_id:myArray_products[index]["pro_id"].toString(),
                        pro_name: myArray_products[index]["pro_name"].toString(),
                        pro_dec: myArray_products[index]["pro_dec"].toString(),
                        pro_img: myArray_products[index]["pro_img"].toString(),
                      );
                    }),
              ),
            ],
          ),
        ),
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
            onTap: () {},
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
class SingleProduct extends StatelessWidget {
   late String pro_id;
   late String pro_name;
   late String pro_dec;
   late String pro_img;

   SingleProduct({required this.pro_id,
    required this.pro_name,
    required this.pro_dec,
    required this.pro_img});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.width * 0.03,
          left: MediaQuery.of(context).size.width * 0.01,
          right: MediaQuery.of(context).size.width * 0.01),
      child: InkWell(
        onTap: (){

        },
        child: Container(
          decoration: BoxDecoration(
              color: btnBglight,
              borderRadius: BorderRadius.circular(15)),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width:90,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3.0,
                    )
                  ],
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(pro_img),
                  ),
                ),
              ),
              SizedBox(width: 7,),
              Column(
                children: [
                  Text(
                    pro_name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 17, fontFamily: 'ca1'),
                  ),
                  Text(
                    pro_dec,
                    style: TextStyle(color: textColor, fontFamily: 'reg'),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
