import 'package:fast_food/screens/Drawer/drawer_list.dart';
import 'package:fast_food/utilty/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();

}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
              color: Colors.amber
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text("هەژمارەکەم", style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0, color: Colors.amber),),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.exit_to_app, color: Colors.red,),
              onPressed: () {

              },
            )
          ],
        ),
        body: SingleChildScrollView(

          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: CircleAvatar(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 4.0),
                            blurRadius: 10.0,
                          )
                        ],
                        image: new DecorationImage(
                          image: new AssetImage("assets/images/hana.jpg"),
                          fit: BoxFit.fill,

                        )
                    ),
                  ),
                  radius: 70,
                ),
              ),
              SizedBox(height: 30,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("ناو", style: userprofilestyle,),
                    SizedBox(height: 4,),
                    Text("Milan Short"),
                    SizedBox(height: 16,),
                    Text("ئیمەیڵ", style: userprofilestyle),
                    SizedBox(height: 4,),
                    Text("milan@gmail.com"),
                    SizedBox(height: 16,),

                    Text("ژ.مۆبایل", style: userprofilestyle),
                    SizedBox(height: 4,),
                    Text("New York, USA"),
                    SizedBox(height: 16,),

                    Text("وشەی تێپەڕ", style: userprofilestyle),
                    SizedBox(height: 4,),
                    Text("New York, USA"),
                    SizedBox(height: 16,),

                    Divider(color: Colors.grey,)
                  ],
                ),
              ),
            ],
          ),


        ),
      ),
    );
  }
}