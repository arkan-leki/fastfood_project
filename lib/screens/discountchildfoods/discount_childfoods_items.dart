import 'package:fast_food/models/childfoods_model.dart';
import 'package:fast_food/models/foods.dart';
import 'package:flutter/material.dart';

class DiscountChildFoodsItem extends StatelessWidget {
  // final ChildFoodsModel model;
  final Food food;

  const DiscountChildFoodsItem(this.food, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection. ltr,
      child: Container(
        width: 350,
        height: 375,
   color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 2.0),
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Column(
                children: <Widget>[
                  Stack(
                    alignment: Alignment.topRight,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10)),
                        child: Image(
                          image: Image.network(food.image).image,
                          height: 200.0,
                          width: double.infinity,
                          fit: BoxFit.cover,

                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey.withOpacity(0.7),
                                radius: 25.0,
                                child: Icon(Icons.star, color: Colors.amber, size: 30.0,),
                              ),
                              Positioned(
                                top: 25,
                                right: 3,
                                child: Text("3.5",style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                ),),
                              ),
                            ],
                          ),

                        ],
                      ),
                      Positioned(
                        bottom: 0.0,
                        right: 0,
                        child:Stack(
                          children: [
                            Image(
                              image: AssetImage("assets/images/logodicount.png"),
                              height: 100.0,
                              width: 100.0,
                              fit: BoxFit.cover,

                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: _childfoods_discPrince(food.price,food.price),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: _childfoods_titles(food.title,food.subtitle),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );

  }
  _childfoods_titles(String titlekurdish, String titleenglish) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        children: [
          Text(
            titlekurdish,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 5.0),
          Text(
            titleenglish.toUpperCase(),
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade600
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10.0),
         _discounttimer("12:30:00"),
        ],
      ),
    );
  }

  _childfoods_discPrince(String oldprice,String newprice) {

    if(int.parse(newprice)<=0)
      return Padding(
        padding: const EdgeInsets.only(left: 10,top: 70),
        child: Text(
          oldprice+" "+"IQ",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      );
    else
      return Padding(
        padding: const EdgeInsets.only(left: 10,top: 30),
        child: Column(
          children: [
            Text(
              newprice+" "+"IQ",
              style: TextStyle(
                color: Colors.red,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.0),
            Text(
              oldprice+" "+"IQ",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.lineThrough,
                color: Colors.grey.shade600,

              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
  }

  _discounttimer(String time) {
    return Row(
      children: [
        Text(time,style: TextStyle(fontSize :16,color: Colors.green.shade600),
        ),
        Icon(Icons.timer,color: Colors.blueAccent,size: 20,),

      ],
    );
  }


}