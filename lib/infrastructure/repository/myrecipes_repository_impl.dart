import 'package:food_recipe/domain/models/food_recipe.dart';
import 'package:food_recipe/domain/repository/myrecipes_repository.dart';
import 'package:food_recipe/infrastructure/local_data/local.dart';

class MyRecipesRepositoryImpl extends MyRecipesRepository {
  final Local local;

  MyRecipesRepositoryImpl({this.local});

  @override
  Future<bool> addRecipe(FoodRecipe recipe) async {
    return await local.saveToLocal(recipe);
  }

  @override
  Future<List<FoodRecipe>> getMyFavoriteRecipes() {
    throw UnimplementedError();
  }

  @override
  Future<bool> removeRecipe(String id) {
    throw UnimplementedError();
  }
}
