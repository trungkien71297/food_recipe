import 'package:food_recipe/domain/models/food_recipe.dart';
import 'package:food_recipe/domain/repository/myrecipes_repository.dart';
import 'package:food_recipe/infrastructure/local_data/local.dart';
import 'package:food_recipe/infrastructure/models/mappers.dart';

class MyRecipesRepositoryImpl extends MyRecipesRepository {
  final Local local;
  final Mappers mappers;
  MyRecipesRepositoryImpl({this.local, this.mappers});

  @override
  Future<bool> addRecipe(FoodRecipe recipe) async {
    return await local.saveToLocal(mappers.foodRecipeToInfra(recipe));
  }

  @override
  Future<List<FoodRecipe>> getMyFavoriteRecipes() async {
    var list = await local.getListFavorites();
    return list.map((e) => mappers.foodRecipeToDomain(e, true)).toList();
  }

  @override
  Future<bool> removeRecipe(String id) async {
    return await local.removeRecipe(id);
  }

  @override
  Future<FoodRecipe> getRecipe(String id) async {
    var recipe = await local.getRecipe(id);
    if (recipe != null)
      return mappers.foodRecipeToDomain(recipe, true);
    else
      return null;
  }
}
