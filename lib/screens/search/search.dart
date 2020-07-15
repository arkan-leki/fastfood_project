import 'dart:convert' as convert;
import 'dart:convert';

import 'package:fast_food/models/foods.dart';
import 'package:fast_food/screens/home_screen.dart';
import 'package:fast_food/utilty/foodsAPI.dart';
import 'package:fast_food/utilty/util.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class Post {
  final String title;
  final String description;
  final String image;

  Post(this.title, this.description, this.image);
}

class _SearchWidgetState extends State<SearchWidget> {
  FoodAPI _foodAPI = FoodAPI();

  Future<List<Post>> search(String search) async {
    print(search);
    await Future.delayed(Duration(seconds: 2));
    String allCatAPI = apibse + foodapi;
    List foods = List<Post>();

    var response = await http.get(allCatAPI);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(utf8.decode(response.bodyBytes));
      for (var data in jsonResponse) {
        Post cat = new Post(data['title'], data['subtitle'], data['image']);
        foods.add(cat);
      }
    }
    return foods;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SearchBar<Post>(
            searchBarStyle: SearchBarStyle(
              backgroundColor: Colors.blueGrey,
              padding: EdgeInsets.all(10),
              borderRadius: BorderRadius.circular(10),
            ),
            loader: Center(
              child: Text("loading..."),
            ),
            hintText: "گەڕان ... ",
            icon: Icon(Icons.search),
            onSearch: search,
            onItemFound: (Post post, int index) {
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
                  onTap: () {
                    setState(() {
                      press(post.title);
                    });
                  },
                  leading: CircleAvatar(
                    backgroundImage: Image.network(post.image).image,
                  ),
                  title: Text(post.title),
                  subtitle: Text(post.description),
                  trailing: Icon(Icons.keyboard_arrow_left),
                  contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
                ),
              );
            },
          ),
        ),
      ),
    );
//    return Scaffold(
//      body: Container(
//        child: Center(
//          child: FutureBuilder(
//            future: _foodAPI.fetchalldata(),
//            builder: (context, AsyncSnapshot snapshot) {
//              if (snapshot.connectionState == ConnectionState.done &&
//                  snapshot.hasData) {
//                return ListView.builder(
//                    itemCount: snapshot.data.length,
//                    scrollDirection: Axis.vertical,
//                    itemBuilder: (context, index) {
//                      Food food = snapshot.data[index];
//                      return new ChildFoodsItem(food);
//                    });
//              } else if (snapshot.hasError) {
//                throw snapshot.error;
//              }
//              // By default, show a loading spinner.
//              return CircularProgressIndicator();
//            },
//          ),
//        ),
//      ),
//      appBar: SearchBar(
//        controller: search,
//        searchHint: "گەڕان ... ",
//        iconified: true,
//        defaultBar: AppBar(
//          iconTheme: IconThemeData(color: Colors.amber),
//          backgroundColor: Colors.white,
//          centerTitle: true,
//          title: Text(
//            "بەشی گەڕان",
//            style: TextStyle(
//                fontWeight: FontWeight.bold,
//                fontSize: 20.0,
//                color: Colors.amber),
//          ),
//        ),
//      ),
//    );
  }

  press(String pos) {
    print(pos);
  }

  Future<List<Post>> getUsers(String s) {
    FutureBuilder<List<Food>>(
        future: _foodAPI.fetchalldata(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            // return: show loading widget
          }
          if (snapshot.hasError) {
            // return: show error widget
          }
          List<Post> users = snapshot.data ?? [];
          return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                Post user = users[index];
                return new ListTile(
                  title: new Text(user.title),
                  onTap: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new HomeScreen()));
                  },
                );
              });
        });
  }
}
