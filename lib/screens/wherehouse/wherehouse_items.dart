import 'package:fast_food/models/whorehouse.dart';
import 'package:fast_food/screens/main_screen.dart';
import 'package:fast_food/utilty/util.dart';
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
                image: model.image=="False"? new AssetImage('assets/images/all.png') : new Image.network(model.image).image,
                fit: BoxFit.cover,
              )),
          child: ListTile(
            leading: CircleAvatar(
              child: Text(model.items),
            ),
            onTap: () {
              warIdAPI = model.id.toString();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainScreen()),
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
