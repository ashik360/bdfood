
import 'package:flutter/material.dart';

import '../../data.dart';
import '../../global/functions.dart';
import '../../widget/custom_grid_tile.dart';
import '../details/detail.dart';

class FastFood extends StatelessWidget {
   final List fastFood = bdfood["fast_food"];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: customGridDelegate(), 
      itemCount: fastFood.length,
      padding: EdgeInsets.all(15),
      itemBuilder: (BuildContext context, int index){
        return CustomGridTile(
          onTap: (){
            Navigator.pushNamed(context, DetailScreen.path, arguments:  {"category": "Fast Food", "data": fastFood[index]});
          },
          imageUrl: fastFood[index]["image"],
          title: fastFood[index]["title"],
          totalIngredients: countIngredients(fastFood[index]["ingredients"]),
        );
      }
    );
  }
}