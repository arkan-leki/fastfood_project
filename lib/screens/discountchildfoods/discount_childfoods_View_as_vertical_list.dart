
import 'package:fast_food/screens/Drawer/drawer_list.dart';
import 'package:fast_food/screens/mycard/mycard_view.dart';
import 'package:flutter/material.dart';
import 'discount_childfoods_list.dart';

class DiscountChildFoodsViewAsVerticalList extends StatefulWidget {
  @override
  _DiscountChildFoodsViewAsVerticalListState createState() => _DiscountChildFoodsViewAsVerticalListState();
}

class _DiscountChildFoodsViewAsVerticalListState extends State<DiscountChildFoodsViewAsVerticalList> {

  List filteredCountries = [];
  bool isSearching = false;
  @override
  void initState() {

    super.initState();
  }

  void _filterCountries(value) {
    setState(() {

    });
  }

  Widget build(BuildContext context) {

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(

        appBar: AppBar(
          iconTheme: IconThemeData(
              color: Colors.amber
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text("داشکاندنەکان", style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0, color: Colors.amber),),
          actions: [
            mycardaleart("100")
          ],
        ),
        drawer: DrawerList(),
        body: Container(
          padding: EdgeInsets.only(left: 15,right: 15,bottom: 20),
            child: DiscountChildFoodsList()),
      ),
    );
  }
  mycardaleart(String NumAleart){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Transform.translate(offset: Offset(-15,-10),
          child: Container(
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
        ),
        IconButton(
          icon: Icon(Icons.shopping_cart,size: 25,),
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