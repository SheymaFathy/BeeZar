import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constants.dart';
import '../../main.dart';
import '../Screens/category/category.dart';

class Drawerr extends StatelessWidget {
  const Drawerr({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Column(
              children: [
                Row(
                  children: [
                    Text(
                      " أهلا بك ",
                      style: TextStyle(color:Colors.white, fontSize: 20.0, fontFamily: 'ca1'),
                    ),

                  ],
                ),
              ],
            ),
            accountEmail: Text(
              sharedPrefs!.getString("email").toString(),
              style: TextStyle(color:Colors.white, fontSize: 20.0, fontFamily: 'ca1'),
            ),

            decoration: BoxDecoration(color: mainColor),
          ),
          Container(
            padding: EdgeInsets.only(right: 10.0, left: 10.0),
            child: Column(
              children: <Widget>[
                InkWell(
                  onTap: () { Get.offNamed('/home');},
                  child: ListTile(
                    title: Text(
                      "الصفحة الرئيسية",
                      style: TextStyle(color:textColor, fontSize: 20.0, fontFamily: 'ca1'),
                    ),
                    leading: Icon(
                      Icons.home,
                      color: itemColor,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: itemColor,
                      size: 18.0,
                    ),
                  ),
                ),
                Divider(
                  color: Colors.grey[500],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 10.0, left: 10.0),
            child: Column(
              children: <Widget>[

              ],
            ),
          ),
          ExpansionTile(
            title: Text(
              "حسابي",
              style: TextStyle(color:textColor, fontSize: 20.0, fontFamily: 'ca1'),
            ),
            children: <Widget>[
//======================child account
              Container(
                padding: EdgeInsets.only(right: 10.0, left: 10.0),
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {


                      },
                      child: ListTile(
                        title: Text(
                          "تغيير كلمة المرور",
                          style: TextStyle(color:textColor, fontSize: 20.0, fontFamily: 'ca1'),
                        ),
                        leading: Icon(
                          Icons.lock_open,
                          color: itemColor,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 18.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //======================end child account
            ],
          ),

          Container(
            padding: EdgeInsets.only(right: 10.0, left: 10.0),
            child: Divider(
              color: Colors.grey[500],
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 10.0, left: 10.0),
            child: Column(
              children:[
                InkWell(
                  onTap: () {

                  },
                  child: ListTile(
                    title: Text(
                      "أضف اعلان",
                      style: TextStyle(color:textColor, fontSize: 20.0, fontFamily: 'ca1'),
                    ),
                    leading: Icon(
                      Icons.add_circle,
                      color:itemColor,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 18.0,
                    ),
                  ),
                ),
                Divider(
                  color: Colors.grey[500],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 10.0, left: 10.0),
            child: Column(
              children: <Widget>[
                InkWell(
                  onTap: () {


                  },
                  child: ListTile(
                    title: Text(
                      "حذف حسابي",
                      style:TextStyle(color:textColor, fontSize: 20.0, fontFamily: 'ca1'),
                    ),
                    leading: Icon(
                      Icons.delete_forever,
                      color: itemColor,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 18.0,
                    ),
                  ),
                ),
                Divider(
                  color: Colors.grey[500],
                ),
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.only(right: 10.0, left: 10.0),
            child: Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    sharedPrefs?.clear();
                    Get.offAllNamed('/start');
                  },
                  child: ListTile(
                    title: Text(
                      "تسجيل خروج",
                      style: TextStyle(color:textColor, fontSize: 20.0, fontFamily: 'ca1'),
                    ),
                    leading: Icon(
                      Icons.logout_outlined,
                      color: itemColor,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 18.0,
                    ),
                  ),
                ),
                Divider(
                  color: Colors.grey[500],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
