
import 'package:fast_food/models/childfoods_model.dart';
import 'package:fast_food/models/foods.dart';
import 'package:flutter/material.dart';
import 'package:fast_food/widgets/circular_clipper.dart';

import 'sizechildfoods/sizechildfoods_list.dart';

class ChildFoodsView extends StatefulWidget {
  // ChildFoodsModel model;
  final Food food;
  ChildFoodsView(this.food);

  @override
  _ChildFoodsViewState createState() => _ChildFoodsViewState(food);


}

class _ChildFoodsViewState extends State<ChildFoodsView> {
  Food _food;
  // ChildFoodsModel model;
  _ChildFoodsViewState(this._food);

  int _counter=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                child: Hero(
                  tag: "assets/images/food1.jpg",
                  child: ClipShadowPath(
                    clipper: CircularClipper(),
                    shadow: Shadow(blurRadius: 20.0),
                    child: Image(
                      height: 400.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      image: Image.network(_food.image).image,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    padding: EdgeInsets.only(left: 30.0),
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back),
                    iconSize: 30.0,
                    color: Colors.white,
                  ),
                  Text(
                    '⭐ ⭐ ⭐ ⭐ ⭐',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(0.7),
                      radius: 25.0,
                      child: IconButton(icon: Icon(Icons.favorite_border),
                           color: Colors.white,
                          iconSize: 30,
                        onPressed: () {
                        /*
                          if( ids.contains( position ) ){
                            ids.remove(position);
                          }else{
                            ids.add(position);
                          }*/
                        },
                         // color: ( ids.contains(position) ) ? Colors.white : Colors.red,
                      )
                  ),

                ],
              ),
              Positioned(
                bottom: 0.0,
                left: 20.0,
                child: _childfoods_discPrince(_food.price,_food.disprice)
              ),
              Positioned(
                bottom: 0.0,
                right: 25.0,
                child: _childfoods_titles(_food.title,_food.subtitle),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: FlatButton(
                       // icon: Icon(Icons.shopping_cart,color: Colors.pink.shade600,),
                        child:  Text('زیادکردن بۆ لیست',style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),
                       ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                          side: BorderSide(color: Colors.pink.shade600),
                        ),
                        onPressed: _addtocard(),
                      ),
                    ),
                    Spacer(),
                    IconButton(icon: Icon(Icons.add_circle),
                        color: Colors.green.shade600 ,
                        iconSize: 30,
                   onPressed: _incrementCounter),
                    Text(
                     " $_counter",
                      style: TextStyle(
                          fontSize: 20.0,
                        color: Colors.black,


                      ),

                    ),
                    IconButton(icon: Icon(Icons.remove_circle),
                        color: Colors.red.shade600  ,
                        iconSize: 30,
                        onPressed: _decrementCounter),
                  ],
                ),
                SizedBox(height: 15.0),
              _size_list(),
                SizedBox(height: 25.0),
                _childfoods_descreption(_food.detiles),
                SizedBox(height: 15.0),
              ],
            ),
          ),

        ],
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter != 0)
        _counter--;
    });
  }

  _addtocard() {

  }

  _size_list() {
    return   Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.only(right: 10,left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _discounttimer("12:30:00"),
              Text("سایز",style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade700,

              ),),
            ],
          ),
        ),
        SizedBox(height: 5,),
        Container(
          decoration: BoxDecoration(
           border: Border.all(
             color: Colors.grey.shade200
           ),
    borderRadius: BorderRadius.circular(10.0),
          ),
          alignment: Alignment.center,
          height: 60,
          child: SizeChildFoodsList(),
        ),
        SizedBox(height: 10,)
      ],
    );
  }

  _childfoods_descreption(String descrep) {
    return Container(
      alignment: Alignment.topRight,
      height: 150.0,
      child: SingleChildScrollView(
        child: Text(descrep,  style: TextStyle(
            color: Colors.black54,
          ),
        ),
      ),
    );
  }

  _childfoods_titles(String titlekurdish, String titleenglish) {
    return Column(
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
          titleenglish,
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade600
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  _childfoods_discPrince(String oldprice,String newprice) {

    if(newprice!="False")
      return Padding(
        padding: const EdgeInsets.only(left: 10,top: 30),
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