import 'package:fast_food/models/foods.dart';
import 'package:fast_food/utilty/foodsAPI.dart';
import 'package:flutter/material.dart';

import 'favourite_items.dart';

// ignore: must_be_immutable
class FavouritesList extends StatelessWidget {
//  List<ChildFoodsModel> list = new List();
  FoodAPI _foodAPI = FoodAPI();

  @override
  Widget build(BuildContext context) {
    // list.add(new ChildFoodsModel("پیتزا","pizza","15000","0","Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.","assets/images/food1.jpg"));
    // list.add(new ChildFoodsModel("titleKurdish","titleenglish","20000","0","ddddddddddddddddddddddddddddd","assets/images/food2.jpg"));
    // list.add(new ChildFoodsModel("titleKurdish","titleenglish","3000","0","ddddddddddddddddddddddddddddd","assets/images/food3.jpg"));

    // list.add(new ChildFoodsModel("پیتزا","pizza","15000","0","Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.","assets/images/food1.jpg"));
    // list.add(new ChildFoodsModel("titleKurdish","titleenglish","20000","0","ddddddddddddddddddddddddddddd","assets/images/food2.jpg"));
    // list.add(new ChildFoodsModel("titleKurdish","titleenglish","3000","0","ddddddddddddddddddddddddddddd","assets/images/food3.jpg"));

    // return ListView.builder(
    // //  physics: ScrollPhysics(),
    //   itemCount: list.length,
    //   scrollDirection: Axis.vertical,
    //   itemBuilder: (context, index) {
    //     ChildFoodsModel itemModel= list[index];
    //     return  FavouritesItem(itemModel);

    //   },

    // );

    return Center(
      child: FutureBuilder(
        future: _foodAPI.fetchalldataFav(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  Food food = snapshot.data[index];
                  return new FavouritesItem(food);
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
