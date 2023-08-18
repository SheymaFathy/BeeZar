import 'package:beezar/components/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../constants.dart';
import '../../Drawer/drawer.dart';

class SubCategoryScreen extends StatefulWidget {
  final String id;
   SubCategoryScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  TextEditingController srch = TextEditingController();
  var myArray_SubCategory = [
    {
      "SubCateg_id": "1",
      "SubCateg_name": "سيارات جديدة",
      "SubCateg_img": "assets/images/cars.jpg",
    },
    {
      "SubCateg_id": "1",
      "SubCateg_name": "سيارات للايجار",
      "SubCateg_img": "assets/images/building.jpeg",
    },
    {
      "SubCateg_id": "1",
      "SubCateg_name": "شقق للبيع",
      "SubCateg_img": "assets/images/building.jpeg",
    },
    {
      "SubCateg_id": "1",
      "SubCateg_name": "شقق للبيع",
      "SubCateg_img": "assets/images/building.jpeg",
    },

  ];
  // Future getSubCategory()async{
  //   final response = await http.get(Uri.parse("https://beezar.arg-tr.com/api/get_sub_category/${widget.id}"));
  //   var data = jsonDecode(response.body.toString());
  //   if (response.statusCode == 200){
  //     Subcategory = data;
  //     index = Subcategory.length;
  //     return Subcategory;
  //   }
  //   else{
  //     return Exception('Failed to fetch item');
  //   }
  //
  // }
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child: Scaffold(
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
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height:580,
            child: ListView.builder(
                itemCount: myArray_SubCategory.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context , int index){
                  return
                    SubCateg(
                      SubCateg_id:myArray_SubCategory[index]["SubCateg_id"].toString(),
                      SubCateg_name:myArray_SubCategory[index]["SubCateg_name"].toString(),
                      SubCateg_img:myArray_SubCategory[index]["SubCateg_img"].toString(),

                    );
                }),
          ),
          SizedBox(height: 10,),
          CustomBtn(onTapBtn: (){
            Get.offNamed('/choose');
          }, btnBgColor: mainColor,btnText: 'عودة للصفحة الرئيسية',btnTxtColor: Colors.white,),
        ],
      ),
    ),
    );
  }
}
class SubCateg extends StatefulWidget {
  late String SubCateg_id;
  late String SubCateg_name;
  late String SubCateg_img;

  SubCateg({required this.SubCateg_id,
    required this.SubCateg_name,
    required this.SubCateg_img});

  @override
  State<SubCateg> createState() => _SubCategState();
}

class _SubCategState extends State<SubCateg> {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 130,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 2.0
                    )
                  ],
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.offNamed('/detail');
                      },
                      child: Container(
                        height: 120,
                        width: 120,
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
                            image: AssetImage(widget.SubCateg_img),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 2,),
                    Text(
                      widget.SubCateg_name,
                      style: TextStyle(fontFamily: 'ca1', fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                width: 130,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 2.0
                      )
                    ],
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.offNamed('/detail');
                      },
                      child: Container(
                        height: 120,
                        width: 120,
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
                            image: AssetImage(widget.SubCateg_img),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 2,),
                    Text(
                      widget.SubCateg_name,
                      style: TextStyle(fontFamily: 'ca1', fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

            ],
          ),

        ],
      ),
    );
  }
}