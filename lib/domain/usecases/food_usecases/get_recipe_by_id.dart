import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:food_recipe/domain/models/food_recipe.dart';
import 'package:food_recipe/domain/repository/food_repository.dart';
import 'package:food_recipe/domain/usecases/usecase.dart';

class GetRecipeById extends Usecase<FoodRecipe, GetRecipeByIdParams> {
  final FoodRepository repository;

  GetRecipeById({@required this.repository});

  @override
  Future<FoodRecipe> call(GetRecipeByIdParams params) async {
    return await repository.getRecipeById(params.id);
  }
}

class GetRecipeByIdParams extends Equatable {
  final String id;

  GetRecipeByIdParams({this.id});

  @override
  List<Object> get props => [this.id];
}
