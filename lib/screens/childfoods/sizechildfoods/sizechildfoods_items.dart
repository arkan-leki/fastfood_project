import 'package:fast_food/models/childfoods_model.dart';
import 'package:fast_food/models/sizechildfoods_model.dart';
import 'package:flutter/material.dart';

import '../childfoods_view.dart';

class SizeChildFoodsItem extends StatelessWidget {
  final SizeChildFoodsModel model;

  const SizeChildFoodsItem(this.model, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.7,
       height: 50,
       padding: EdgeInsets.only(left: 10,right: 10),
       margin: EdgeInsets.only(left: 10,right: 10),
       child: Card(
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.all(Radius.circular(10.0)),
         ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "IQ"+" "+model.price,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Spacer(),
              Text(
                model.title,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Radio(value: model.value, groupValue: model.groupValue, onChanged: null),


            ],
          ),
       ),
    );

  }

}