import 'package:fast_food/screens/Drawer/drawer_list.dart';
import 'package:fast_food/utilty/style.dart';
import 'package:flutter/material.dart';


class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          backgroundColor:Colors.white,
          appBar: AppBar(
            backgroundColor:Colors.white ,
            iconTheme: IconThemeData(
              color: Colors.grey.shade700, //change your color here
            ),
            title: Text('دەربارە',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0, color: Colors.green.shade600)),
            centerTitle: true,
          ),


          body: Container(
            padding: EdgeInsets.only(top: 25,),
           child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Column(
                          children: <Widget>[
                            Text('Company Name',
                              style: titleStyleAboutSultna
                            ),
                            SizedBox(height: 8,),
                            Text('ناوی کۆمپانیا',
                                style: titleStyleAboutSultna
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: ExactAssetImage('assets/images/food3.jpg'),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle,
                        ),
                        width: 110,
                        height: 110,
                        margin: EdgeInsets.only(right: 16,),
                      ),

                    ],
                  ),
                  SizedBox(height: 50,),
                  Container(
                    child: Text("ناو نیشان : کەلار _ تەنیشت کتێبخانەی گشتی  ",
                        style: detilesAboutSultna
                    ),
                  ),

                ],
           ),


          ),

        ),
      ),
    );

  }}