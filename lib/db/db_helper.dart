import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../model/recipe_model.dart';

class DbHelper {
  DbHelper._privateConstructor();

  static final DbHelper instance = DbHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async => _database ?? await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentDirectory.path, 'recipe.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute("""
   
  CREATE TABLE recipe(
    id INTEGER PRIMARY KEY,
    title TEXT,
    image TEXT,
    ingredients TEXT,
    directions TEXT,
    youtubeUrl TEXT
  )

  """);

    await db.execute("""
   
  CREATE TABLE cooked(
    id INTEGER PRIMARY KEY,
    title TEXT,
    image TEXT,
    ingredients TEXT,
    directions TEXT,
    youtubeUrl TEXT
  )

  """);
  }

  Future<int> addFavoriteRecipe(RecipeModel recipeModel) async {
    if(recipeModel.toJson().isNotEmpty){
      Fluttertoast.showToast(
        msg: "This recipe is added your favorite list",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0
    );
    }
    Database db = await instance.database;
    return await db.insert("recipe", recipeModel.toJson());
  }

  Future<int> addCookedRecipe(RecipeModel recipeModel) async {
    if(recipeModel.toJson().isNotEmpty){
      Fluttertoast.showToast(
        msg: "This recipe is added your cooked list",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0
    );
    }
    Database db = await instance.database;
    return await db.insert("cooked", recipeModel.toJson());
  }

  Future<List<RecipeModel>> getCookedRecipe() async {
 
    Database db = await instance.database;
    var cooked = await db.query("cooked", orderBy: "id");

    List<RecipeModel> recipelist = cooked.isNotEmpty ? cooked.map((data) => RecipeModel.fromJson(data)).toList(): [];
    return recipelist;
  }

  Future<List<RecipeModel>> getFavoriteRecipe() async {
    Database db = await instance.database;
    var favorite = await db.query("recipe", orderBy: "id");

    List<RecipeModel> recipelist = favorite.isNotEmpty
        ? favorite.map((data) => RecipeModel.fromJson(data)).toList()
        : [];
    print('daa; $recipelist');

    return recipelist;
  }

  Future deleteFavoriteItem(int? id) async {
    Database db = await instance.database;
    db.delete("recipe", where: "id=?", whereArgs: [id]);
  }

  Future deleteCookedItem(int? id) async {
    Database db = await instance.database;
    db.delete("cooked", where: "id=?", whereArgs: [id]);
  }
}
