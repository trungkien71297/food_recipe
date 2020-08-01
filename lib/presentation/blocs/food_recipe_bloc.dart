import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:food_recipe/domain/models/food_category.dart';
import 'package:food_recipe/domain/models/food_recipe.dart';
import 'package:food_recipe/domain/usecases/food_usecases/get_categories.dart';
import 'package:food_recipe/domain/usecases/food_usecases/get_random_recipe.dart';
import 'package:food_recipe/domain/usecases/food_usecases/get_recipe_by_id.dart';
import 'package:food_recipe/domain/usecases/food_usecases/get_recipes_by_cate.dart';
import 'package:food_recipe/domain/usecases/usecase.dart';

class FoodRecipeBloc {
  final GetCategories _getCategories;
  final GetRandomRecipe _getRandomRecipe;
  final GetRecipeById _getRecipeById;
  final GetRecipesByCate _getRecipesByCate;

  FoodRecipeBloc(
      {@required GetCategories getCategories,
      @required GetRandomRecipe getRandomRecipe,
      @required GetRecipeById getRecipeById,
      @required GetRecipesByCate getRecipesByCate})
      : assert(getCategories != null),
        assert(getRandomRecipe != null),
        assert(getRecipeById != null),
        assert(getRecipesByCate != null),
        _getCategories = getCategories,
        _getRandomRecipe = getRandomRecipe,
        _getRecipeById = getRecipeById,
        _getRecipesByCate = getRecipesByCate;

  final StreamController<List<FoodCategory>> _categoriesList =
      StreamController();
  final StreamController<FoodRecipe> _randomFood = StreamController();
  Stream<List<FoodCategory>> get categoriesList => _categoriesList.stream;
  Stream<FoodRecipe> get randomFood => _randomFood.stream;

  List<FoodCategory> foodCategories;
  FoodRecipe foodRandom;
  getListCategory() async {
    foodCategories = await _getCategories(NoParams());
    _categoriesList.sink.add(foodCategories);
  }

  getRandomRecipe() async {
    foodRandom = await _getRandomRecipe(NoParams());
    _randomFood.sink.add(foodRandom);
  }

  dispose() {
    _categoriesList.close();
    _randomFood.close();
  }
}
