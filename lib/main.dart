
import 'package:flutter/material.dart';

import 'screen/about_us/about_us.dart';
import 'screen/cooked.dart';
import 'screen/details/detail.dart';
import 'screen/favorite.dart';
import 'screen/home/home.dart';
import 'screen/tips/tips.dart';
import 'screen/video/video.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'রান্নাঘর',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomeScreen.path,
      routes: {
        HomeScreen.path: (ctx) => HomeScreen(),
        DetailScreen.path: (ctx) => DetailScreen(),
        YoutubeScreen.path: (ctx) => YoutubeScreen(),
        Favorite.path: (ctx) => Favorite(),
        AboutUs.path: (ctx) => AboutUs(),
        CookingTips.path: (ctx) => CookingTips(),
        Cooked.path: (ctx) => Cooked(),
      },
    );
  }
}
