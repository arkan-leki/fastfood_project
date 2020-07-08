
import 'package:fast_food/screens/Drawer/drawer_list.dart';
import 'package:fast_food/screens/main_screen.dart';
import 'package:fast_food/screens/mycard/mycard_view.dart';
import 'package:flutter/material.dart';
import 'favourite_list.dart';


class FavouritsView extends StatefulWidget {
  @override
  _FavouritsViewState createState() => _FavouritsViewState();
}

class _FavouritsViewState extends State<FavouritsView> {
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

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(

        appBar:AppBar(
          iconTheme: IconThemeData(
              color: Colors.grey.shade700
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text("دڵخوازەکان", style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0, color: Colors.green.shade600),)
        ),
        body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.only(bottom: 100),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: FavouritesList())),
        floatingActionButton: _FloatingActionButton(),
      ),
    );

  }

  FloatingActionButton _FloatingActionButton(){
    return FloatingActionButton(
      onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyCardView()),
        );
      },
      backgroundColor: Colors.pink.shade600,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.shopping_basket,
            color: Colors.white,
          ),
          Text('0'),
        ],
      ),

    );
  }


}
