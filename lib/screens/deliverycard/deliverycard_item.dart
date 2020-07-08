import 'package:fast_food/models/deliverycard_model.dart';
import 'package:flutter/material.dart';
class DeliveryCardItem extends StatelessWidget {

  final DeliveryCardModel model;

  const DeliveryCardItem(this.model, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10,right: 10,bottom: 5,top: 5),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('ناوی کڕیار',style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade400,

                  ),

                  ),
                  Text(model.castusername,style: TextStyle(
                      fontSize: 16,
                      color: Colors.black
                  ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("ژ.مۆبایل",style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade400,

                  ),

                  ),
                  Text( model.castphonenumber,style: TextStyle(
                      fontSize: 16,
                      color: Colors.black
                  ),
                  )
                ],
              ),


          Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('ئیمەیڵ',style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade400,

                  ),

                  ),
                  Text(model.castemali,style: TextStyle(
                      fontSize: 16,
                      color: Colors.black
                  ),
                  )
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('ژ.داواکاری',style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade400,

                  ),

                  ),
                  Text( model.idrequest,style: TextStyle(
                      fontSize: 16,
                      color: Colors.black
                  ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('کاتی دەرچوون',style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade400,

                  ),

                  ),
                  Text( "${model.start}",style: TextStyle(
                      fontSize: 16,
                      color: Colors.green.shade600
                  ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('کاتی گەشتن',style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade400,

                  ),

                  ),
                  Text("${model.end}",style: TextStyle(
                      fontSize: 16,
                      color: Colors.red
                  ),
                  )
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('ناوی شۆفێر',style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade400,

                  ),

                  ),
                  Text( model.usernamedraver,style: TextStyle(
                      fontSize: 16,
                      color: Colors.black
                  ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("ژمارەوجۆری گواستنەوە",style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade400,

                  ),

                  ),
                  Text( model.numberanddetilesofcardelivery,style: TextStyle(

                      fontSize: 16,
                      color: Colors.black
                  ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('ناونیشان',style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade400,

                  ),

                  ),
                  Text( model.address,style: TextStyle(
                      fontSize: 16,
                      color: Colors.black
                  ),
                  )
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('نرخی لیست',style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade400,

                  ),

                  ),
                  Text( model.pricelist+" "+"IQ",style: TextStyle(
                      fontSize: 16,
                      color: Colors.black
                  ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('داشکاندن',style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade400,

                  ),

                  ),
                  Text( model.discount+" "+"IQ",style: TextStyle(
                      fontSize: 16,
                      color: Colors.black
                  ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('دیلڤەری',style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade400,

                  ),

                  ),
                  Text( model.delivery+" "+"IQ",style: TextStyle(
                      fontSize: 16,
                      color: Colors.black
                  ),
                  )
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("کۆی گشتی",style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade400,

                  ),

                  ),
                  Text( model.totalprice+" "+"IQ",style: TextStyle(
                      fontSize: 16,
                      color: Colors.black
                  ),
                  )
                ],
              ),

            ],
          ),
        ),
      ),


    );
  }
  _WidgetOf_price(String pricelist,String discountofprice,String dilveryprice) {
    return  Container(
      padding: EdgeInsets.only(left: 10,right: 10,bottom: 5,top: 5),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('پارەی لیست',style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade400,

                  ),

                  ),
                  Text( pricelist+" "+"IQ",style: TextStyle(
                      fontSize: 16,
                      color: Colors.black
                  ),
                  )
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("داشکاندن",style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade400,

                  ),

                  ),
                  Text( discountofprice+" "+"IQ",style: TextStyle(
                      fontSize: 16,
                      color: Colors.black
                  ),
                  )
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('دیلڤەری',style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade400,

                  ),

                  ),
                  Text( dilveryprice+" "+"IQ",style: TextStyle(
                      fontSize: 16,
                      color: Colors.black
                  ),
                  )
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('کۆی گشتی',style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade400,

                  ),

                  ),
                  Text( "20000"+" "+"IQ",style: TextStyle(
                      fontSize: 16,
                      color: Colors.black
                  ),
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
