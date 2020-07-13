import 'dart:collection';
import 'dart:convert';
import 'dart:convert' as convert;

import 'package:fast_food/models/UserModel.dart';
import 'package:fast_food/utilty/util.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'util.dart';

class CustomerAPI {
  Future insertDataTransForm(
      HashMap<String, String> requestsMap, GlobalKey<ScaffoldState> key) async {
    var request =
        http.MultipartRequest('POST', Uri.parse(apibse + customerApi));
    request.fields.addAll(requestsMap);
    request.files.add(
        await http.MultipartFile.fromPath('image', requestsMap['filename']));
    var streamedRespond = await request.send();
    var response = await http.Response.fromStream(streamedRespond);
    print(response.statusCode);
    if (response.statusCode == 201) {
      return true;
    } else {
      var data = convert.jsonDecode(utf8.decode(response.bodyBytes));
      key.currentState.showSnackBar(new SnackBar(
        content: new Text(
            "ئەم ئیمەیڵە پێشتر بەکار هاتووە یان دوبارە هەموو خانەکان پڕبکەرەوە"),
      ));
      return false;
    }
  }

  Future fetchalldataById() async {
    String allCatAPI = apibse + customerApi + "&phoneid=$phoneid";
    print(allCatAPI);
    List foods = List<UserModel>();

    var response = await http.get(allCatAPI);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(utf8.decode(response.bodyBytes));
      for (var data in jsonResponse) {
        UserModel cat = new UserModel(
          data['id'].toString(),
          data['name'].toString(),
          data['password'].toString(),
          data['instrument_purchase'].toString(),
          data['house_no'].toString(),
          data['address_line1'].toString(),
          data['address_line2'].toString(),
          data['phone'].toString(),
          data['phoneid'].toString(),
          data['country'].toString(),
          data['image'].toString(),
          data['email'].toString(),
        );
        foods.add(cat);
      }
    }
    return foods;
  }
}
