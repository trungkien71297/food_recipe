import 'package:flutter/foundation.dart';
import 'package:food_recipe/domain/models/food_recipe.dart';
import 'package:food_recipe/domain/repository/food_repository.dart';
import 'package:food_recipe/domain/usecases/usecase.dart';

class GetRandomRecipe extends Usecase<FoodRecipe, NoParams> {
  final FoodRepository repository;

  GetRandomRecipe({@required this.repository});

  @override
  Future<FoodRecipe> call(NoParams noParams) async {
    return await repository.getRandomRecipe();
  }
}
