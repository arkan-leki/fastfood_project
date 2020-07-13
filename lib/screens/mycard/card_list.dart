import 'package:fast_food/models/childfoods_model.dart';
import 'package:flutter/material.dart';

import 'card_item.dart';

class CardList extends StatelessWidget {
  List<ChildFoodsModel> list = new List();

  @override
  Widget build(BuildContext context) {
    list.add(new ChildFoodsModel(
        "پیتزا",
        "pizza",
        "15000",
        "0",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        "assets/images/food1.jpg"));
    list.add(new ChildFoodsModel("titleKurdish", "titleenglish", "20000", "0",
        "ddddddddddddddddddddddddddddd", "assets/images/food2.jpg"));
    list.add(new ChildFoodsModel("titleKurdish", "titleenglish", "3000", "0",
        "ddddddddddddddddddddddddddddd", "assets/images/food3.jpg"));

    list.add(new ChildFoodsModel(
        "پیتزا",
        "pizza",
        "15000",
        "0",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        "assets/images/food1.jpg"));
    list.add(new ChildFoodsModel("titleKurdish", "titleenglish", "20000", "0",
        "ddddddddddddddddddddddddddddd", "assets/images/food2.jpg"));
    list.add(new ChildFoodsModel("titleKurdish", "titleenglish", "3000", "0",
        "ddddddddddddddddddddddddddddd", "assets/images/food3.jpg"));

    return ListView.builder(
      //  physics: ScrollPhysics(),
      itemCount: list.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        ChildFoodsModel itemModel = list[index];
        return CardItem(itemModel);
      },
    );
  }
}
