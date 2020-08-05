import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:food_recipe/domain/repository/myrecipes_repository.dart';
import 'package:food_recipe/domain/usecases/usecase.dart';

class RemoveRecipe extends Usecase<bool, RemoveRecipeParams> {
  final MyRecipesRepository repository;

  RemoveRecipe({@required this.repository});

  @override
  Future<bool> call(RemoveRecipeParams params) async {
    return await repository.removeRecipe(params.id);
  }
}

class RemoveRecipeParams extends Equatable {
  final String id;

  RemoveRecipeParams({this.id});

  @override
  List<Object> get props => [this.id];
}
