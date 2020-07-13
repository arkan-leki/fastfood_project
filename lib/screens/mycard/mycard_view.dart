import 'package:fast_food/screens/mycard/card_list.dart';
import 'package:flutter/material.dart';

class MyCardView extends StatefulWidget {
  @override
  _MyCardViewState createState() => _MyCardViewState();
}

class _MyCardViewState extends State<MyCardView> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.grey.shade700),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text("لیستەکەم",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.green.shade600)),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child:
                    Container(alignment: Alignment.center, child: CardList())),
            _WidgetOf_price("2000", "0", "0"),
            _BottonCardRequest(),
          ],
        ),
        //   bottomSheet: _BottonCardRequest(),
      ),
    );
  }

  Widget _BottonCardRequest() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(bottom: 6),
      child: FlatButton.icon(
        icon: Icon(
          Icons.chevron_left,
          color: Colors.pink.shade600,
        ),
        label: Text(' داواکردن',
            style: TextStyle(color: Colors.black, fontSize: 20)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
          side: BorderSide(color: Colors.pink.shade600),
        ),
        onPressed: () {
          //  Navigator.push(context, MaterialPageRoute(builder: (context)=>TransformFoods()),);
        },
      ),
    );
  }

  _WidgetOf_price(
      String pricelist, String discountofprice, String dilveryprice) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'پارەی لیست',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  Text(
                    pricelist + " " + "IQ",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  )
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "داشکاندن",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  Text(
                    discountofprice + " " + "IQ",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  )
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'دیلڤەری',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  Text(
                    dilveryprice + " " + "IQ",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  )
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'کۆی گشتی',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  Text(
                    "20000" + " " + "IQ",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
