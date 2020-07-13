import 'package:fast_food/models/foods.dart';
import 'package:fast_food/screens/childfoods/childfoods_view.dart';
import 'package:flutter/material.dart';

class ChildFoodsItem extends StatefulWidget {
  // ChildFoodsModel model;
  final Food foodModel;

  ChildFoodsItem(this.foodModel);

  @override
  _ChildFoodsItemState createState() => _ChildFoodsItemState(foodModel);
}

class _ChildFoodsItemState extends State<ChildFoodsItem> {
  // ChildFoodsModel model;
  Food _food;

  _ChildFoodsItemState(this._food);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 400,
      height: 350,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
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
                        image: Image.network(_food.image).image,
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
                              child: Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 50.0,
                              ),
                            ),
                            Positioned(
                              top: 15,
                              right: 15,
                              child: Text(
                                _food.avgRatings.toString(),
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(0.7),
                            radius: 25.0,
                            child: IconButton(
                                icon: Icon(Icons.favorite_border),
                                color: Colors.white,
                                iconSize: 30,
                                onPressed: () => print("favorite_border"))),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        child: _childfoods_discPrince(
                            _food.price, _food.disprice)),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: _childfoods_titles(_food.title, _food.subtitle),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        width: 35,
                        height: 35,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            border: new Border.all(color: Colors.green),
                          ),
                          child: IconButton(
                            //    padding: EdgeInsets.only(left: 10.0),
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ChildFoodsView(_food))),
                            icon: Icon(Icons.add),
                            iconSize: 20.0,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
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
          SizedBox(height: 10.0),
          Text(
            titleenglish.toUpperCase(),
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade600),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  _childfoods_Prince(String price) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 70),
      child: Text(
        "IQ" + " " + price,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  _childfoods_discPrince(String oldprice, String newprice) {
    if (newprice == "False")
      return Padding(
        padding: const EdgeInsets.only(left: 10, top: 30),
        child: Text(
          oldprice + " " + "IQ",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      );
    else
      return Padding(
        padding: const EdgeInsets.only(left: 10, top: 30),
        child: Column(
          children: [
            Text(
              newprice + " " + "IQ",
              style: TextStyle(
                color: Colors.red,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.0),
            Text(
              oldprice + " " + "IQ",
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
}
