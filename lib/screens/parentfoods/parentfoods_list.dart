import 'package:fast_food/models/Cat.dart';
import 'package:fast_food/models/parentfoods_model.dart';
import 'package:fast_food/screens/childfoods/childfoods_list_view.dart';
import 'package:fast_food/utilty/CatsAPI.dart';
import 'package:fast_food/utilty/axis.dart';
import 'package:flutter/material.dart';

import 'parentfoods_items.dart';

// ignore: must_be_immutable
class ParentFoodsList extends StatelessWidget {
  List<ParentFoodsModel> list = new List();

  @override
  Widget build(BuildContext context) {
    CatAPI _cat = CatAPI();

    return Center(
      child: FutureBuilder(
        future: _cat.fetchalldata(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                scrollDirection:axis,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  Cat cat = snapshot.data[index];
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChildFoodsListView(
                                  "${cat.nameEg} / ${cat.nameKu}", cat.id)),
                        );
                      },
                      child: ParentFoodsItem(cat));
                });
          } else if (snapshot.hasError) {
            throw snapshot.error;
          }
          // By default, show a loading spinner.
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
