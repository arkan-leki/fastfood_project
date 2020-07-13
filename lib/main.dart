import 'package:device_id/device_id.dart';
import 'package:fast_food/screens/loginform/loginPage.dart';
import 'package:fast_food/utilty/util.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  String _deviceid = 'Unknown';

  Future<void> initDeviceId() async {
    _deviceid = await DeviceId.getID;
    phoneid = _deviceid;
    print("phoneid : " + phoneid);
  }

  @override
  Widget build(BuildContext context) {
    initDeviceId();
    return MaterialApp(
      title: "Fast Food",
      debugShowCheckedModeBanner: false,
      home:
          Directionality(textDirection: TextDirection.rtl, child: LoginPage()),
    );
  }
}
