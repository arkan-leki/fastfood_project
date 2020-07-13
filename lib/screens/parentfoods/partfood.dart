/*
class ParentFoodsList extends StatelessWidget {
*/
import 'package:fast_food/screens/Drawer/drawer_list.dart';
import 'package:fast_food/screens/mycard/mycard_view.dart';
import 'package:fast_food/screens/parentfoods/parentfoods_list.dart';
import 'package:fast_food/utilty/axis.dart';
import 'package:flutter/material.dart';

class ParentFoods extends StatefulWidget {
  @override
  _ParentFoodsListState createState() => _ParentFoodsListState();
}

class _ParentFoodsListState extends State<ParentFoods> {
  List filteredCountries = [];
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    axis = Axis.vertical;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.amber),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "خواردنەکان",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.amber),
          ),
          actions: [
            mycardaleart("100"),
          ],
        ),
        body: Container(
            padding: EdgeInsets.only(left: 30, right: 30, bottom: 20),
            child: ParentFoodsList()),
        drawer: DrawerList(),
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
}
