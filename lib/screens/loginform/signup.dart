import 'dart:collection';

import 'package:fast_food/screens/main_screen.dart';
import 'package:fast_food/utilty/customerAPI.dart';
import 'package:fast_food/utilty/util.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'Widget/bezierContainer.dart';
import 'loginPage.dart';
import 'package:image_picker/image_picker.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  HashMap<String, String> requestsMap = new HashMap();
  Future<File> imageFile;
  final username = TextEditingController();
  final password = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final key = new GlobalKey<ScaffoldState>();
  var customerAPI = new CustomerAPI();

  String file;

  pickImageFromGellry(ImageSource source) {
    setState(() {
      imageFile = ImagePicker.pickImage(source: source);
    });
  }

  Widget ShowImges() {
    return FutureBuilder<File>(
      future: imageFile,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          file = snapshot.data.path;
          return Container(
            padding: EdgeInsets.all(1),
            child: CircleAvatar(
              backgroundImage: new FileImage(
                snapshot.data,
              ),
              radius: 70,
            ),
          );
        } else {
          return const Text(
            "هیچ وێنەیەک دیاری نەکرا!",
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Text('گەڕانەوە',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  Widget _entryField(String title, TextEditingController controll,
      {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              controller: controll,
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _submitButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xfffbb448), Color(0xfff7892b)])),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: FlatButton(
          child: Text(
            'تۆمارکردن',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          onPressed: () {
            if (file != null) {
              requestsMap['name'] = username.text;
              requestsMap['email'] = email.text;
              requestsMap['phone'] = phone.text;
              requestsMap['password'] = password.text;
              requestsMap['phoneid'] = phoneid;
              requestsMap['filename'] = file;
              requestsMap['instrument_purchase'] = "Unknown";
              requestsMap['house_no'] = "Unknown";
              requestsMap['address_line1'] = "Unknown";
              requestsMap['address_line2'] = "Unknown";
              requestsMap['zip_code'] = "Unknown";
              requestsMap['country'] = "Unknown";
              customerAPI
                  .insertDataTransForm(requestsMap, key)
                  .then((value) => push(value));
            }
          },
        ),
      ),
    );
  }

  push(bool resp) {
    if (resp) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    }
  }

  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'پێشتر خۆت تۆمارکردوە؟',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'چوونە ژوورەوە',
              style: TextStyle(
                  color: Color(0xfff79c4f),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _userImage(String userImagepath) {
    return Container(
      padding: EdgeInsets.all(10),
      child: CircleAvatar(
        child: Stack(
          children: [
            ShowImges(),
            Positioned(
              bottom: 0,
              child: IconButton(
                icon: Icon(
                  Icons.camera_alt,
                  color: Colors.amber,
                ),
                onPressed: () {
                  pickImageFromGellry(ImageSource.gallery);
                },
              ),
            ),
          ],
        ),
        radius: 70,
      ),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("ناو", username),
        _entryField("ئیمەیڵ", email),
        _entryField("ژ.مۆبایل", phone),
        _entryField("وشەی تئێپەڕ", password, isPassword: true),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: key,
        body: Container(
          height: height,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: -MediaQuery.of(context).size.height * .15,
                right: -MediaQuery.of(context).size.width * .4,
                child: BezierContainer(),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: height * .2),
                      _userImage("assets/images/hana.jpg"),
                      SizedBox(
                        height: 50,
                      ),
                      _emailPasswordWidget(),
                      SizedBox(
                        height: 20,
                      ),
                      _submitButton(),
                      SizedBox(height: height * .14),
                      _loginAccountLabel(),
                    ],
                  ),
                ),
              ),
              Positioned(top: 40, left: 0, child: _backButton()),
            ],
          ),
        ),
      ),
    );
  }
}
