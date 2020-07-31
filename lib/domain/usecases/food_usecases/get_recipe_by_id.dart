import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:food_recipe/domain/models/food_recipe.dart';
import 'package:food_recipe/domain/repository/food_repository.dart';
import 'package:food_recipe/domain/usecases/usecase.dart';

class GetRecipeById extends Usecase<FoodRecipe, Params> {
  final FoodRepository repository;

  GetRecipeById({@required this.repository});

  @override
  Future<FoodRecipe> call(Params params) async {
    return await repository.getRecipeById(params.id);
  }
}

class Params extends Equatable {
  final String id;

  Params({this.id});

  @override
  List<Object> get props => [this.id];
}
