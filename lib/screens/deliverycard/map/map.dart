import 'package:fast_food/screens/Drawer/drawer_list.dart';
import 'package:fast_food/screens/mycard/card_list.dart';
import 'package:flutter/material.dart';
class MapDelivery extends StatefulWidget {
  @override
  _MapDeliveryState createState() => _MapDeliveryState();
}

class _MapDeliveryState extends State<MapDelivery> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.grey.shade700
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("نەخشە", style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0, color: Colors.green.shade600)),

      ),
      body: Container(
        color: Colors.amber,
      )
     //   bottomSheet: _BottonCardRequest(),
    );
  }

 }
