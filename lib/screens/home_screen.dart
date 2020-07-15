import 'package:fast_food/screens/mycard/mycard_view.dart';
import 'package:fast_food/screens/top10/top10_list.dart';
import 'package:fast_food/screens/wherehouse/wherehouse_list.dart';
import 'package:fast_food/utilty/axis.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Drawer/drawer_list.dart';
import 'discountchildfoods/discount_childfoods_list.dart';
import 'parentfoods/parentfoods_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List filteredCountries = [];
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    axis = Axis.horizontal; // madwe byu arkan
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.amber),
            actions: <Widget>[mycardaleart("100")],
          ),
          drawer: DrawerList(),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 10, left: 10),
                      child: Text(
                        "دیاری کردنی بنکە",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 200.0,
                      width: double.infinity,
                      padding: EdgeInsets.only(right: 10, left: 10),
                      child: WhereHouseList(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 360.0,
                  width: double.infinity,
                  child: DiscountChildFoodsList(),
                ),
                SizedBox(height: 15.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 10, left: 10),
                      child: Text(
                        "لیستی بەرهەمەکان",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 300,
                      child: ParentFoodsList(),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 10, left: 10),
                      child: Text(
                        "زۆرترین داواکراوەکان",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      height: 375,
                      child: Top10List(),
                    ),
                  ],
                ),
                SizedBox(height: 30.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  mycardaleart(String NumAleart) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Transform.translate(
          offset: Offset(-15, -10),
          child: Container(
            alignment: Alignment.center,
            width: 30,
            height: 30,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.red),
            child: Text(
              NumAleart,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.shopping_cart,
            size: 25,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyCardView()),
            );
          },
        ),
      ],
    );
  }

  _title() {
    return TextStyle(
      fontSize: 22,
      color: Colors.amber,
    );
  }
}
