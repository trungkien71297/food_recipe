import 'package:flutter/foundation.dart';
import 'package:jokes/domain/models/food_recipe.dart';
import 'package:jokes/domain/repository/myrecipes_repository.dart';
import 'package:jokes/domain/usecases/usecase.dart';

class GetMyFavoriterecipes extends Usecase<List<FoodRecipe>, NoParams> {
  final MyRecipesRepository repository;

  GetMyFavoriterecipes({@required this.repository});

  @override
  Future<List<FoodRecipe>> call(NoParams params) async {
    return await repository.getMyFavoriteRecipes();
  }
}
