import 'dart:convert' as convert;
import 'dart:convert';

import 'package:fast_food/models/whorehouse.dart';
import 'package:http/http.dart' as http;

import 'util.dart';

class WhorehouseAPI {
  Future fetchalldata() async {
    String allCatAPI = apibse + whoreapi;
    List<Whorehouse> list = List<Whorehouse>();
    list.add(Whorehouse('', 'هەموو',
       'False', '100' ));

    var response = await http.get(allCatAPI);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(utf8.decode(response.bodyBytes));
      for (var data in jsonResponse) {
        Whorehouse war = Whorehouse(
            data['id'].toString(),
            data['title'].toString(),
            data['image'].toString(),
            data['items'].toString());
        list.add(war);
      }
    }
    return list;
  }
}
