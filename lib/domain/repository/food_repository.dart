import 'package:jokes/domain/models/food_category.dart';
import 'package:jokes/domain/models/food_recipe.dart';

abstract class FoodRepository {
  Future<FoodRecipe> getRecipeById(String id);
  Future<FoodRecipe> getRandomRecipe();
  Future<List<FoodRecipe>> getRecipesByCate(String cate);
  Future<List<FoodCategory>> getCategories();
}
