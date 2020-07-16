import 'package:fast_food/models/UserModel.dart';
import 'package:fast_food/utilty/customerAPI.dart';
import 'package:fast_food/utilty/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  CustomerAPI _userAPI = CustomerAPI();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.amber),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "هەژمارەکەم",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.amber),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.red,
              ),
              onPressed: () {},
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: FutureBuilder(
              future: _userAPI.fetchalldataById(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData &&
                    snapshot.data != '[]') {
                  print(snapshot.data[0]);
                  UserModel userModel = snapshot.data[0];
                  return Column(
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
                                  image:
                                      new Image.network(userModel.image).image,
                                  fit: BoxFit.fill,
                                )),
                          ),
                          radius: 70,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "ناو",
                              style: userprofilestyle,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(userModel.name),
                            SizedBox(
                              height: 16,
                            ),
                            Text("ئیمەیڵ", style: userprofilestyle),
                            SizedBox(
                              height: 4,
                            ),
                            Text(userModel.email),
                            SizedBox(
                              height: 16,
                            ),
                            Text("ژ.مۆبایل", style: userprofilestyle),
                            SizedBox(
                              height: 4,
                            ),
                            Text(userModel.phone),
                            SizedBox(
                              height: 16,
                            ),
                            Text("وشەی تێپەڕ", style: userprofilestyle),
                            SizedBox(
                              height: 4,
                            ),
                            Text(userModel.password),
                            SizedBox(
                              height: 16,
                            ),
                            Divider(
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  throw snapshot.error;
                }
                return CircularProgressIndicator();
              },
            ),
          ),
        ),
      ),
    );
  }
}
