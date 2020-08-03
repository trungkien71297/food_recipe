import 'dart:convert';

import 'package:food_recipe/domain/models/food_recipe.dart';
import 'package:hive/hive.dart';

class Local {
  String path;
  Box box;
  Local({this.path}) {
    Hive.init(path);
  }

  Future<bool> saveToLocal(FoodRecipe foodRecipe) async {
    try {
      await _openBox();
      box.put(foodRecipe.id, foodRecipe);
      await _closeBox();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  _openBox() async {
    if (!Hive.isBoxOpen("recipes")) {
      Hive.registerAdapter(FoodRecipeAdapter());
      box = await Hive.openBox<FoodRecipe>("recipes");
    } else return;
  }

  _closeBox() async {
    await Hive.close();
  }
}

class FoodRecipeAdapter extends TypeAdapter<FoodRecipe> {
  @override
  read(BinaryReader reader) {
    return reader.read();
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, obj) {
    writer.write(obj);
  }
}
