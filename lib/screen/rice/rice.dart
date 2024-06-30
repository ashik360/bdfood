
import 'package:flutter/material.dart';

import '../../data.dart';
import '../../global/functions.dart';
import '../../widget/custom_grid_tile.dart';
import '../details/detail.dart';

class Rice extends StatelessWidget {
  final List rice = bdfood["rice"];



  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: customGridDelegate(), 
      itemCount: rice.length,
      padding: EdgeInsets.all(15),
      itemBuilder: (BuildContext context, int index){
        return CustomGridTile(
          onTap: (){
            Navigator.pushNamed(context, DetailScreen.path, arguments:  {"category": "Rice", "data": rice[index]});
          },
          imageUrl: rice[index]["image"],
          title: rice[index]["title"],
          totalIngredients: countIngredients(rice[index]["ingredients"]),
        );
      }
    );
  }
}

