import 'dart:collection';
import 'dart:convert';
import 'dart:convert' as convert;

import 'package:fast_food/utilty/util.dart';
import 'package:http/http.dart' as http;

import 'util.dart';

class FavAPI {
  Future addFav(String foodId) async {
    String Currentid = CurrentUser.id;
    String allCatAPI = apibse + 'faves/?customer=$Currentid&food=$foodId';
    print(allCatAPI);
    var response = await http.get(allCatAPI);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(utf8.decode(response.bodyBytes));
      print(jsonResponse);
      if (jsonResponse.length == 0) {
        var url = apibse + "faves/";
        HashMap<String, dynamic> requestsMap = new HashMap();
        requestsMap['food'] = foodId;
        requestsMap['customer'] = CurrentUser.id;
        var response = await http.post(url,
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(requestsMap));
        print(response.statusCode);
        if (response.statusCode == 201) {
          print(response.body);
        } else {
          print(response.body);
          throw response.statusCode;
        }
      }
    } else {
      print(response.statusCode);
    }
  }
}
