import 'package:fast_food/models/sizechildfoods_model.dart';
import 'package:flutter/material.dart';

import 'sizechildfoods_items.dart';
class SizeChildFoodsList extends StatelessWidget {

  List<SizeChildFoodsModel> list = new List();


  @override
  Widget build(BuildContext context) {
    list.add(new SizeChildFoodsModel("بچووک ","3000",true,1));
    list.add(new SizeChildFoodsModel("مامناوەند","6000",false,1));
    list.add(new SizeChildFoodsModel("گەورە","10000",false,1));




    return ListView.builder(
      itemCount: list.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        SizeChildFoodsModel itemModel= list[index];
        return  SizeChildFoodsItem(itemModel);

      },

    );
  }

}
