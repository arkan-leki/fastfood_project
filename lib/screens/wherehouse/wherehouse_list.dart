import 'package:fast_food/models/whorehouse.dart';
import 'package:fast_food/utilty/WharehouseAPI.dart';
import 'package:flutter/material.dart';

import 'wherehouse_items.dart';

// ignore: must_be_immutable
class WhereHouseList extends StatelessWidget {
  WhorehouseAPI _foodAPI = WhorehouseAPI();

  @override
  Widget build(BuildContext context) {
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
