
import 'dart:io';

import 'package:fast_food/about/About.dart';
import 'package:fast_food/screens/childfoods/childfoods_list.dart';
import 'package:fast_food/screens/deliverycard/deliverycard_view.dart';
import 'package:fast_food/screens/discountchildfoods/discount_childfoods_View_as_vertical_list.dart';
import 'package:fast_food/screens/favourite/favourite_view.dart';
import 'package:fast_food/screens/home_screen.dart';
import 'package:fast_food/screens/mycard/mycard_view.dart';
import 'package:fast_food/screens/parentfoods/parentfoods_list.dart';
import 'package:fast_food/screens/parentfoods/partfood.dart';
import 'package:fast_food/screens/top10/top10_view_as_vertical_list.dart';
import 'package:fast_food/screens/useraccount/user.dart';
import 'package:fast_food/utilty/axis.dart';
import 'package:fast_food/utilty/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class DrawerList extends StatefulWidget {
  @override
  _DrawerListState createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {

  String NumAleart ="100";
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
          width: 300,
       color: Colors.white,
        //  padding: EdgeInsets.only(left: 10,right: 10),
          child: ListView(
            children: [
            _DrawerHeader(),


              ListTile(
                leading: new Icon(Icons.shopping_cart,color: Colors.amber),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    new Text('لیستەکەم',style: drawerlisttiltel_style,),
                    Container(
                      alignment: Alignment.center,
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red),
                      child:  Text(NumAleart,style: TextStyle(
                        color: Colors.white,
                      ),),
                    ),
                  ],
                ),
                onTap: () {
                  axis=Axis.vertical;
                  _Navigationpushpop(MyCardView());

                },
              ),
              ListTile(
                leading: new Icon(Icons.favorite,color: Colors.amber),
                title: new Text('دڵخوازەکان',style: drawerlisttiltel_style,),
                onTap: () {
                  _Navigationpushpop(FavouritsView());

                },
              ),
              ListTile(
                leading: new Icon(Icons.directions_car,color: Colors.amber),
                title: new Text('دلیڤەری',style: drawerlisttiltel_style,),
                onTap: () {
                  _Navigationpushpop(DeliveryCardView());

                },
              ),

              ListTile(
                leading: new Icon(Icons.new_releases,color: Colors.amber),
                title: new Text('دەربارە',style: drawerlisttiltel_style,),
                onTap: () {
                  _Navigationpushpop(About());

                },
              ),
              ListTile(
                leading: new Icon(Icons.exit_to_app,color: Colors.amber),
                title: new Text('چوونەدەرە',style: drawerlisttiltel_style,),
                onTap: () {
                  setState(() {
                    SystemNavigator.pop();
                  });
                },
              ),

              SizedBox(height: 30,)
            ],
          ),

      ),
    );
  }

  _DrawerHeader() {
    return    UserAccountsDrawerHeader(
      accountName: Text("omarahmad"),
      accountEmail: Text("omarahmad@gmail.com"),

      decoration: BoxDecoration(
          color: Colors.amber
      ),
      currentAccountPicture: new CircleAvatar(
        backgroundColor: Colors.white,
      ),

    );
  }

  void _Navigationpushpop(Widget child) {
    Navigator.of(context).pop();
    Navigator.of(context).push(
        new PageRouteBuilder(
            pageBuilder: (BuildContext context, _, __) {
              return child;
            },
            transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
              return new FadeTransition(
                  opacity: animation,
                  alwaysIncludeSemantics: true,
                  child: child
              );
            }
        )
    );
  }


}
