import 'package:fast_food/screens/Drawer/drawer_list.dart';
import 'package:fast_food/screens/top10/top10_list.dart';
import 'package:flutter/material.dart';

class Top10ViewAsVerticalList extends StatefulWidget {
  @override
  _Top10ViewAsVerticalListState createState() => _Top10ViewAsVerticalListState();
}

class _Top10ViewAsVerticalListState extends State<Top10ViewAsVerticalList> {
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
          title: !isSearching
              ? Text("خۆشترینەکان", style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0, color: Colors.green.shade600),)
              : TextField(
            enableInteractiveSelection: true,
            autocorrect: true,
            onChanged: (value) {
              _filterCountries(value);
            },
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                icon: Icon(
                  Icons.search,
                  color:  Colors.blue,
                ),
                hintText: "گەڕان...",
                hintStyle: TextStyle(color: Colors.grey.shade700)),
          ),
          actions: <Widget>[
            isSearching
                ?IconButton(
              icon: Icon(Icons.close,color: Colors.red),
              onPressed: () {
                setState(() {
                  this.isSearching = false;

                });
              },
            )
                :IconButton(
              icon: Icon(Icons.search,color: Colors.grey.shade700,),
              onPressed: () {
                setState(() {
                  this.isSearching = true;
                });
              },
            )

          ],
        ),
        drawer: DrawerList(),
        body: Container(
          padding: EdgeInsets.only(left: 50,right: 50,bottom: 20),
            child: Top10List()),
      ),
    );
  }


}
