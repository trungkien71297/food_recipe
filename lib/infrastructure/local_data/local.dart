import 'package:food_recipe/infrastructure/models/food_recipe_infra.dart';
import 'package:hive/hive.dart';

class Local {
  String path;
  Box box;
  Local({this.path}) {
    Hive.init(path);
    Hive.registerAdapter<FoodRecipeInfra>(FoodRecipeInfraAdapter());
  }

  Future<bool> saveToLocal(FoodRecipeInfra food) async {
    try {
      await _openBox("recipes");
      /////
      await box.put(food.idMeal, food);
      await _closeBox();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<FoodRecipeInfra>> getListFavorites() async {
    List<FoodRecipeInfra> favorites = [];
    try {
      await _openBox("recipes");
      /////
      box.toMap().forEach((key, value) => favorites.add(value));
      await _closeBox();
    } catch (e) {
      print(e);
    }
    return favorites;
  }

  Future<bool> removeRecipe(String id) async {
    try {
      await _openBox("recipes");
      /////
      await box.delete(id);
      await _closeBox();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<FoodRecipeInfra> getRecipe(String id) async {
    FoodRecipeInfra recipe;
    try {
      await _openBox("recipes");
      /////
      recipe = box.get(id);
      await _closeBox();
    } catch (e) {
      print("getRecipe" + e);
    }
    return recipe;
  }

  _openBox(String name) async {
    try {
      if (!Hive.isBoxOpen(name)) {
        box = await Hive.openBox<FoodRecipeInfra>(name);
      } else
        return;
    } catch (e) {
      print("open " + e.toString());
    }
  }

  _closeBox() async {
    await Hive.close();
  }
}
