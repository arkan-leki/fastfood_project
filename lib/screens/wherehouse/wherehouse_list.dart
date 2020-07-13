import 'package:fast_food/models/whorehouse.dart';
import 'package:fast_food/utilty/WharehouseAPI.dart';
import 'package:flutter/material.dart';

import 'wherehouse_items.dart';

class WhereHouseList extends StatelessWidget {
  WhorehouseAPI _foodAPI = WhorehouseAPI();

  @override
  Widget build(BuildContext context) {
//    return ListView.builder(
//      scrollDirection: Axis.horizontal,
//      itemCount: list.length,
//      itemBuilder: (BuildContext context, int index) {
//        WhereHouseModel itemModel= list[index];
//        return  WhereHouseItem(itemModel);
//      },
//    );

    return Center(
      child: FutureBuilder(
        future: _foodAPI.fetchalldata(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Whorehouse whorehouse = snapshot.data[index];
                  return WhereHouseItem(whorehouse);
                });
          } else if (snapshot.hasError) {
            throw snapshot.error;
          }
          // By default, show a loading spinner.
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
