
import 'package:flutter/material.dart';

import '../../constant/constant.dart';
import '../../global/functions.dart';
import '../about_us/about_us.dart';
import '../bread/bread.dart';
import '../cooked.dart';
import '../desert/desert.dart';
import '../fast_food/fast_food.dart';
import '../favorite.dart';
import '../non_veg/non_veg.dart';
import '../rice/rice.dart';
import '../tips/tips.dart';

class HomeScreen extends StatefulWidget {
  static const String path = "HomeScreen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 List items = ["Rice", "Desert", "Bread", "FastFood", "NonVeg1","Desert2", "Bread3", "FastFood4"];
 List gridColors = [Colors.pink, Colors.red, Colors.yellow, Colors.purple, Colors.green, Colors.blue, Colors.orange, Colors.cyanAccent];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          
          backgroundColor: Colors.red,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text("bd food recipes".toUpperCase(), style: TextStyle(color: Colors.white),),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Favorite.path);
              },
              icon: Icon(Icons.favorite),
            )
          ],
        ),
        
        drawer: Drawer(
          child: Container(
            color: Colors.black87,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/non_veg/1.jpg",
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, Favorite.path);
                  },
                  title: Text(
                    "Favorite",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ),
                ),
                Divider(
                  thickness: 0.5,
                  color: Colors.white,
                  height: 0,
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, Cooked.path);
                  },
                  title: Text(
                    "Cooked",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ),
                ),
                Divider(
                  thickness: 0.5,
                  color: Colors.white,
                  height: 0,
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, CookingTips.path);
                  },
                  title: Text(
                    "Tips",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ),
                ),
                Container(
                  color: Colors.black54,
                  width: double.infinity,
                  height: 60,
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "More",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                ListTile(
                  onTap: () {
                    launchURL(appLink);
                  },
                  leading: Icon(
                    Icons.rate_review,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Rate Us",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ),
                ),
                ListTile(
                  onTap: () {
                    launchURL(appLink);
                  },
                  leading: Icon(
                    Icons.update,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Update",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, AboutUs.path);
                  },
                  leading: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  title: Text(
                    "About us",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),

        body: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TabBar(
                tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  labelPadding: EdgeInsets.symmetric(horizontal: 10),
                  indicatorWeight: 1.0,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: Colors.orange,
                  dividerColor: Colors.white,
                  dividerHeight: 0,
                  unselectedLabelStyle: TextStyle(
                    color: Colors.green,
                  ),
                  labelStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Gilroy"),
                  unselectedLabelColor: Colors.red,
                  labelColor: Colors.white,
                  indicator: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(4.0),
                  ),
                  tabs: [
                    Tab(child: Text("Rice",)),
                    Tab(child: Text("Desert")),
                    Tab(child: Text("Bread")),
                    Tab(child: Text("Fast-Food")),
                    Tab(child: Text("Non-Veg")),
                  ]),
            ),
            Expanded(
              child: TabBarView(
                  children: [Rice(), Desert(), Bread(), FastFood(), NonVeg()]),
            )
          ],
      ),
      )
    );
  }
}
