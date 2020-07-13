import 'package:fast_food/models/Cat.dart';
import 'package:fast_food/models/parentfoods_model.dart';
import 'package:fast_food/screens/childfoods/childfoods_list_view.dart';
import 'package:fast_food/utilty/CatsAPI.dart';
import 'package:flutter/material.dart';

import 'parentfoods_items.dart';

class ParentFoodsList extends StatelessWidget {
  List<ParentFoodsModel> list = new List();

  @override
  Widget build(BuildContext context) {
    // list.add(new ParentFoodsModel("pizza","پیتزا","assets/images/food1.jpg"));
    // list.add(new ParentFoodsModel("hamburgger","هەمبەرگر","assets/images/food2.jpg"));
    // list.add(new ParentFoodsModel("mreshk","مریشک","assets/images/food3.jpg"));

    // list.add(new ParentFoodsModel("pizza","پیتزا","assets/images/food1.jpg"));
    // list.add(new ParentFoodsModel("hamburgger","هەمبەرگر","assets/images/food2.jpg"));
    // list.add(new ParentFoodsModel("mreshk","مریشک","assets/images/food3.jpg"));

    // return Scaffold(

    //   body: ListView.builder(
    //   //  physics: ScrollPhysics(),
    //     itemCount: list.length,

    //     scrollDirection:axis,
    //     itemBuilder: (context, index) {
    //       ParentFoodsModel itemModel= list[index];
    //       return GestureDetector(
    //         onTap: (){
    //           Navigator.push(
    //             context,
    //             MaterialPageRoute(builder: (context) => ChildFoodsListView("${itemModel.title_english} / ${itemModel.title_kurdish}")),
    //           );
    //         },
    //         child: ParentFoodsItem(itemModel)
    //       );
    //     },

    //   ),
    // );

    CatAPI _cat = CatAPI();

    return Center(
      child: FutureBuilder(
        future: _cat.fetchalldata(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Cat cat = snapshot.data[index];
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChildFoodsListView(
                                  "${cat.nameEg} / ${cat.nameKu}")),
                        );
                      },
                      child: ParentFoodsItem(cat));
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
