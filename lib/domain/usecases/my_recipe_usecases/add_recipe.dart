import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:jokes/domain/models/food_recipe.dart';
import 'package:jokes/domain/repository/myrecipes_repository.dart';
import 'package:jokes/domain/usecases/usecase.dart';

class AddRecipe extends Usecase<bool, Params> {
  final MyRecipesRepository repository;

  AddRecipe({@required this.repository});

  @override
  Future<bool> call(Params params) async {
    return await repository.addRecipe(params.recipe);
  }
}

class Params extends Equatable {
  final FoodRecipe recipe;

  Params({this.recipe});

  @override
  List<Object> get props => [this.recipe];
}
