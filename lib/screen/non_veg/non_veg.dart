
import 'package:flutter/material.dart';

import '../../data.dart';
import '../../global/functions.dart';
import '../../widget/custom_grid_tile.dart';
import '../details/detail.dart';

class NonVeg extends StatelessWidget {
  final List nonVeg = bdfood["non_veg"];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: customGridDelegate(), 
      itemCount: nonVeg.length,
      padding: EdgeInsets.all(15),
      itemBuilder: (BuildContext context, int index){
        return CustomGridTile(
          onTap: (){
            Navigator.pushNamed(context, DetailScreen.path, arguments:  {"category": "Non-Veg", "data": nonVeg[index]});
          },
          imageUrl: nonVeg[index]["image"],
          title: nonVeg[index]["title"],
          totalIngredients: countIngredients(nonVeg[index]["ingredients"]),
        );
      }
    );
  }
}