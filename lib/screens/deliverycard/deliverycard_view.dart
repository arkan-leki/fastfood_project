import 'package:fast_food/screens/deliverycard/deliverycard_list.dart';
import 'package:flutter/material.dart';

import 'map/map.dart';

class DeliveryCardView extends StatefulWidget {
  @override
  _DeliveryCardViewState createState() => _DeliveryCardViewState();
}

class _DeliveryCardViewState extends State<DeliveryCardView> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.grey.shade700),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text("دلیڤەری",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.green.shade600)),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.location_on,
                  color: Colors.blue,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MapDelivery()),
                  );
                }),
          ],
        ),

        body: DeliveryCardList(),
        //   bottomSheet: _BottonCardRequest(),
      ),
    );
  }
}
