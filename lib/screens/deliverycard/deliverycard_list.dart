import 'package:fast_food/models/deliverycard_model.dart';
import 'package:flutter/material.dart';

import 'deliverycard_item.dart';

class DeliveryCardList extends StatelessWidget {
  List<DeliveryCardModel> list = new List();

  @override
  Widget build(BuildContext context) {
    list.add(new DeliveryCardModel(
        "ahmad muhamad",
        "07700054655",
        "ahmadahmadmu00546550000@gmail.com",
        "12345",
        DateTime.now(),
        DateTime.now(),
        "kalar-bngrd",
        "belal omar muhamd",
        "2344 slui-iraq",
        "20000",
        "0",
        "0",
        "20000"));

    return ListView.builder(
      //  physics: ScrollPhysics(),
      itemCount: list.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        DeliveryCardModel itemModel = list[index];
        return DeliveryCardItem(itemModel);
      },
    );
  }
}
