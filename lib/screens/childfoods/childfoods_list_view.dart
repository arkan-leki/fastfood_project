import 'package:fast_food/screens/childfoods/childfoods_list.dart';
import 'package:flutter/material.dart';

class ChildFoodsListView extends StatelessWidget {
  final String title;

  final String catId;

  const ChildFoodsListView(
    this.title, this.catId, {
    Key key,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.green),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.green.shade600)),
      ),
      body: SingleChildScrollView(
          child: Container(
              height: MediaQuery.of(context).size.height,
              child: ChildFoodsList(catId))),
    );
  }
}
