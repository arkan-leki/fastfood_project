import 'package:fast_food/models/childfoods_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardItem extends StatefulWidget {
  ChildFoodsModel model;

  CardItem(this.model);

  @override
  _CardItemState createState() => _CardItemState(model);
}

class _CardItemState extends State<CardItem> {
  ChildFoodsModel model;

  _CardItemState(this.model);

  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      width: 275,
      height: 275,
      child: Card(
        child: Container(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(model.titlekurdish,
                      style: TextStyle(fontSize: 20, color: Colors.black)),
                  IconButton(
                      icon: Icon(Icons.close, color: Colors.grey.shade700),
                      onPressed: () {})
                ],
              ),
              Expanded(
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: _Widgetditelescard(
                                model.price, "بچووک", "$_counter")),
                      ),
                      Container(
                        width: 150,
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          children: [_Image(model.imageUrl), _Bottonedite()],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _Bottonedite() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(bottom: 6),
      child: FlatButton.icon(
        icon: Icon(
          Icons.edit,
          color: Colors.black,
        ),
        label: Text('گۆڕانکاری',
            style: TextStyle(color: Colors.black, fontSize: 20)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
          side: BorderSide(color: Colors.blueGrey),
        ),
        onPressed: () {
          //  Navigator.push(context, MaterialPageRoute(builder: (context)=>TransformFoods()),);
        },
      ),
    );
  }

  _Image(String imageUrl) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Image(
        image: AssetImage(imageUrl),
        height: 125.0,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  _Widgetditelescard(String price, String size, String _counter) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'نرخ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade400,
              ),
            ),
            Text(
              price + " " + "IQ",
              style: TextStyle(fontSize: 16, color: Colors.black),
            )
          ],
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'قەبارە',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade400,
              ),
            ),
            Text(
              size,
              style: TextStyle(fontSize: 16, color: Colors.black),
            )
          ],
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'دانە',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade400,
              ),
            ),
            Spacer(),
            IconButton(
                icon: Icon(Icons.add_circle),
                color: Colors.green.shade600,
                iconSize: 30,
                onPressed: _incrementCounter),
            Text(
              " $_counter",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
              ),
            ),
            IconButton(
                icon: Icon(Icons.remove_circle),
                color: Colors.red.shade600,
                iconSize: 30,
                onPressed: _decrementCounter),
          ],
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'کۆی نرخ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade400,
              ),
            ),
            Text(
              price + " " + "IQ",
              style: TextStyle(fontSize: 16, color: Colors.black),
            )
          ],
        ),
      ],
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter != 0) _counter--;
    });
  }
}
