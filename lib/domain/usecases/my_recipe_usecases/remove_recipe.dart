import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:food_recipe/domain/repository/myrecipes_repository.dart';
import 'package:food_recipe/domain/usecases/usecase.dart';

class RemoveRecipe extends Usecase<bool, Params> {
  final MyRecipesRepository repository;

  RemoveRecipe({@required this.repository});

  @override
  Future<bool> call(Params params) async {
    return await repository.removeRecipe(params.id);
  }
}

class Params extends Equatable {
  final String id;

  Params({this.id});

  @override
  List<Object> get props => [this.id];
}
