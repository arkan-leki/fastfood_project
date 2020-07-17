import 'package:device_id/device_id.dart';
import 'package:fast_food/screens/loginform/loginPage.dart';
import 'package:fast_food/screens/main_screen.dart';
import 'package:fast_food/utilty/customerAPI.dart';
import 'package:fast_food/utilty/util.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  String _deviceid = 'Unknown';

  Future<void> initDeviceId() async {
    _deviceid = await DeviceId.getID;
    phoneid = _deviceid;
    print("phoneid : " + phoneid);
  }

  page() {}

  @override
  Widget build(BuildContext context) {
    initDeviceId();
    return FutureBuilder(
        future: new CustomerAPI().check(phoneid),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            if (snapshot.data.length != 0) {
              return MaterialApp(
                title: "Fast Food",
                debugShowCheckedModeBanner: false,
                home: Directionality(
                    textDirection: TextDirection.rtl, child: MainScreen()),
              );
            } else {
              return MaterialApp(
                  title: "Fast Food",
                  debugShowCheckedModeBanner: false,
                  home: Directionality(
                      textDirection: TextDirection.rtl, child: LoginPage()));
            }
          }
          return Container(
            color: Colors.white,
            child: Center(child: CircularProgressIndicator()),
          );
        });
  }
}
