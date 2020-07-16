import 'package:fast_food/models/foods.dart';
import 'package:fast_food/screens/childfoods/childfoods_view.dart';
import 'package:fast_food/utilty/axis.dart';
import 'package:fast_food/utilty/foodsAPI.dart';
import 'package:flutter/material.dart';

import 'discount_childfoods_items.dart';

class DiscountChildFoodsList extends StatelessWidget {
  final bool vert;
  DiscountChildFoodsList([this.vert]);
  @override
  Widget build(BuildContext context) {
    FoodAPI _foodAPI = FoodAPI();

    return Center(
      child: FutureBuilder(
        future: _foodAPI.fetchalldataDispring(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                scrollDirection: vert==true? Axis.vertical : axis,
                itemBuilder: (context, index) {
                  Food food = snapshot.data[index];
                  return new GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChildFoodsView(food)),
                      );
                    },
                    child: DiscountChildFoodsItem(food),
                  );
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
