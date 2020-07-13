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
          data['avg_ratings'].toString() == "null" ? "0" : data['avg_ratings'],
          data['deleted'],
          data['isDispriced'],
          data['disprice'].toString(),
          data['dispriceTitle'].toString(),
          data['dispriceDate'].toString(),
        );
        foods.add(cat);
      }
    }
    return foods;
  }

  Future fetchalldataDispring() async {
    String allCatAPI = apibse + foodapi;
    List foods = List<Food>();

    var response = await http.get(allCatAPI);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(utf8.decode(response.bodyBytes));
      for (var data in jsonResponse) {
        if (data['isDispriced'] == true) {
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
            data['avg_ratings'],
            data['deleted'],
            data['isDispriced'],
            data['disprice'].toString(),
            data['dispriceTitle'].toString(),
            data['dispriceDate'].toString(),
          );
          foods.add(cat);
        }
      }
    }
    return foods;
  }

  Future fetchalldataByRate() async {
    String allCatAPI = apibse + foodapi + "&orderBy=\"avgRatings\"";
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
          data['avg_ratings'],
          data['deleted'],
          data['isDispriced'],
          data['disprice'].toString(),
          data['dispriceTitle'].toString(),
          data['dispriceDate'].toString(),
        );
        foods.add(cat);
      }
    }
    return foods;
  }

  fetchalldataByID(String catId) async {
    String allCatAPI = apibse + foodz + "&category_id=1";
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
          data['avg_ratings'].toString() == "null" ? "0" : data['avg_ratings'],
          data['deleted'],
          data['isDispriced'],
          data['disprice'].toString(),
          data['dispriceTitle'].toString(),
          data['dispriceDate'].toString(),
        );
        foods.add(cat);
      }
      return foods;
    }
  }
}
