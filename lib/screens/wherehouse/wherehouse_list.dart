import 'package:fast_food/models/sizechildfoods_model.dart';
import 'package:fast_food/models/wherhouse_model.dart';
import 'package:flutter/material.dart';

import 'wherehouse_items.dart';
class WhereHouseList extends StatelessWidget {

  List<WhereHouseModel> list = new List();


  @override
  Widget build(BuildContext context) {
    Color selectcolor = Colors.white;

    list.add(new WhereHouseModel("هەموو ","assets/images/all.png"));
    list.add(new WhereHouseModel("فاست فوود ","assets/images/food1.jpg"));
    list.add(new WhereHouseModel("سۆپەر مارکێت","assets/images/market.jpg"));
    list.add(new WhereHouseModel("چەرەزات و شرینی","assets/images/choco.jpg"));
    list.add(new WhereHouseModel("جلوبەرگی پیاوان","assets/images/man.jpg"));
    list.add(new WhereHouseModel("جلوبەرگی منداڵان و ئافرەتان","assets/images/child.jpg"));
    list.add(new WhereHouseModel("کەرەستەی ناوماڵ","assets/images/home.jpg"));
    list.add(new WhereHouseModel("جوانکاری خانمان","assets/images/makeup.jpg"));
    list.add(new WhereHouseModel("جیهانی بۆن(عطر)","assets/images/atr.jpg"));

    return ListView.builder(
      //scrollDirection: Axis.horizontal,
      itemCount: list.length,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color:selectcolor,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(position.toString()),
              ),
              title: Text("omaromar",
                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
              onTap: () {

                print(list[position]);

              },
            ),
          ),
        );
      },
    );
  }

}
