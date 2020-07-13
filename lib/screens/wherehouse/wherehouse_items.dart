import 'package:fast_food/models/whorehouse.dart';
import 'package:fast_food/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WhereHouseItem extends StatelessWidget {
  final Whorehouse model;

  const WhereHouseItem(
    this.model, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: 125,
          height: 125,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                image: new Image.network(model.image).image,
                fit: BoxFit.cover,
              )),
          child: ListTile(
            leading: CircleAvatar(
              child: Text(model.items),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(model.title)
      ],
    );
  }
}
