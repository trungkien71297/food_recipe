import 'package:food_recipe/domain/models/food_recipe.dart';

abstract class MyRecipesRepository {
  Future<List<FoodRecipe>> getMyFavoriteRecipes();
  Future<bool> removeRecipe(String id);
  Future<bool> addRecipe(FoodRecipe recipe);
}
