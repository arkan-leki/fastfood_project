import 'package:fast_food/models/Cat.dart';
import 'package:flutter/material.dart';

class ParentFoodsItem extends StatelessWidget {
  // final ParentFoodsModel model;
  final Cat cat;

  const ParentFoodsItem(
    this.cat, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      height: 300,
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
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                  image: Image.network(cat.image).image, fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Text(
                cat.nameKu,
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
                  cat.nameEg,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
