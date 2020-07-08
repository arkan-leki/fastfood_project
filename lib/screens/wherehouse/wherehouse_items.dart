
import 'package:fast_food/models/wherhouse_model.dart';
import 'package:flutter/material.dart';


class WhereHouseItem extends StatelessWidget {
  final WhereHouseModel model;

  const WhereHouseItem(this.model, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(right: 20),
      child:  Column(
        children: <Widget>[
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                  image: new AssetImage(model.Urlimage),
                  fit: BoxFit.cover,
                )
            ),
          ),
          SizedBox(height: 15,),
          Text(model.title)
        ],
      ),
    );

  }

}
