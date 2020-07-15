import 'package:fast_food/models/foods.dart';
import 'package:fast_food/screens/childfoods/childfoods_view.dart';
import 'package:fast_food/utilty/foodsAPI.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  FoodAPI _foodAPI = FoodAPI();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SearchBar<Food>(
            searchBarStyle: SearchBarStyle(
              padding: EdgeInsets.all(10),
              borderRadius: BorderRadius.circular(10),
            ),
            loader: Center(
              child: Text("loading..."),
            ),
            hintText: "گەڕان ... ",
            icon: Icon(Icons.search),
            onSearch: _foodAPI.search,
            onItemFound: (Food food, int index) {
              return Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    border: Border.all(
                        color: Colors.pink[800], // set border color
                        width: 3.0), // set border width
                    borderRadius: BorderRadius.all(
                        Radius.circular(10.0)), // set rounded corner radius
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          color: Colors.black,
                          offset: Offset(1, 3))
                    ] // make rounded corner of border
                    ),
                child: ListTile(
                  dense: true,
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChildFoodsView(food))),
                  leading: CircleAvatar(
                    backgroundImage: Image.network(food.image).image,
                  ),
                  title: Text(food.title),
                  subtitle: Text(food.subtitle),
                  trailing: Icon(Icons.keyboard_arrow_left),
                  contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
