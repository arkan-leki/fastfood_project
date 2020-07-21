import 'package:fast_food/models/foods.dart';
import 'package:fast_food/utilty/favAPI.dart';
import 'package:fast_food/utilty/util.dart';
import 'package:flutter/material.dart';

class Top10Item extends StatefulWidget {
  // final ChildFoodsModel model;
  final Food food;

  const Top10Item(
    this.food, {
    Key key,
  }) : super(key: key);

  @override
  _Top10ItemState createState() => _Top10ItemState();
}

class _Top10ItemState extends State<Top10Item> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      height: 350,
      width: MediaQuery.of(context).size.width * .6,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0.0, 4.0),
              blurRadius: 10.0,
            )
          ]),
      child: Column(
        children: <Widget>[
          Stack(
            children: [
              Container(
                height: 180.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                        image: Image.network(widget.food.image).image,
                        fit: BoxFit.cover)),
              ),
              Positioned(
                top: 1,
                right: 1,
                child: CircleAvatar(
                    backgroundColor: Colors.grey.withOpacity(0.7),
                    radius: 25.0,
                    child: fav_user.contains(int.parse(widget.food.id))
                        ? IconButton(
                            icon: Icon(Icons.favorite),
                            color: Colors.red,
                            iconSize: 30,
                            onPressed: () => print("favorite_border"))
                        : IconButton(
                            icon: Icon(Icons.favorite_border),
                            color: Colors.white,
                            iconSize: 30,
                            onPressed: () {
                              setState(() {
                                fav_user.add(int.parse(widget.food.id));
                                FavAPI().addFav(widget.food.id);
                              });
                            })),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            widget.food.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              //fontFamily: 'lato',
              fontSize: 20.0,
              color: Color(0xFF444444),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              widget.food.subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            '⭐ ⭐ ⭐ ⭐ ⭐',
            style: TextStyle(fontSize: 20.0),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 0.0, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'IQ',
                  style: TextStyle(
                      fontSize: 25.0,
                      //fontFamily: 'lato',
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFCA60)),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  '${widget.food.price}',
                  style: TextStyle(
                    color: Color(0xFFFFCA60),
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  push() {
    setState(() {
    });
  }
}
