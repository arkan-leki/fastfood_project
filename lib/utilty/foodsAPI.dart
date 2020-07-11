import 'dart:convert' as convert;
import 'dart:convert';
import 'package:fast_food/models/foods.dart';
import 'package:http/http.dart' as http;
import 'util.dart';

class FoodAPI {
  Future fetchalldata() async {
    String allCatAPI = apibse + foodapi;
    List foods = List<Food>();

    var response = await http.get(allCatAPI);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(utf8.decode(response.bodyBytes));
      for (var data in jsonResponse) {
        Food cat = new Food(
            data['id'].toString(),
            data['category'].toString(),
            data['categoryWar'],
            data['image'],
            data['sell_price'],
            data['title'],
            data['subtitle'],
            data['detiles'],
            data['dateAdd'],
            data['popularity'],
            data['avgRatings'],
            data['deleted'],
            data['isDisprice'],
            data['disprice'],
            data['dispriceTitle']
            );
        foods.add(cat);
      }
    }
    return foods;
  }
}
