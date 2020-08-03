import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:food_recipe/domain/models/food_category.dart';
import 'package:food_recipe/domain/models/food_recipe.dart';
import 'package:food_recipe/domain/usecases/food_usecases/get_categories.dart';
import 'package:food_recipe/domain/usecases/food_usecases/get_random_recipe.dart';
import 'package:food_recipe/domain/usecases/food_usecases/get_recipe_by_id.dart';
import 'package:food_recipe/domain/usecases/food_usecases/get_recipes_by_cate.dart';
import 'package:food_recipe/domain/usecases/my_recipe_usecases/add_recipe.dart';
import 'package:food_recipe/domain/usecases/my_recipe_usecases/get_my_favorite_recipes.dart';
import 'package:food_recipe/domain/usecases/usecase.dart';

class FoodRecipeBloc {
  final GetCategories _getCategories;
  final GetRandomRecipe _getRandomRecipe;
  final GetRecipeById _getRecipeById;
  final GetRecipesByCate _getRecipesByCate;
  final AddRecipe _addRecipe;
  final GetMyFavoriterecipes _getMyFavoriterecipes;

  FoodRecipeBloc(
      {@required GetCategories getCategories,
      @required GetRandomRecipe getRandomRecipe,
      @required GetRecipeById getRecipeById,
      @required GetRecipesByCate getRecipesByCate,
      @required AddRecipe addRecipe, 
      @required GetMyFavoriterecipes getMyFavoriterecipes})
      : assert(getCategories != null),
        assert(getRandomRecipe != null),
        assert(getRecipeById != null),
        assert(getRecipesByCate != null),
        assert(addRecipe!=null),
        assert(getMyFavoriterecipes!=null),
        _getCategories = getCategories,
        _getRandomRecipe = getRandomRecipe,
        _getRecipeById = getRecipeById,
        _getRecipesByCate = getRecipesByCate,
        _addRecipe = addRecipe,
        _getMyFavoriterecipes = getMyFavoriterecipes;

  final StreamController<List<FoodCategory>> _categoriesList =
      StreamController();
  final StreamController<FoodRecipe> _randomFood = StreamController();
  final StreamController<List<FoodRecipe>> _listFood =
      StreamController.broadcast();
  final StreamController<FoodRecipe> _foodById = StreamController.broadcast();
  Stream<List<FoodCategory>> get categoriesList => _categoriesList.stream;
  Stream<FoodRecipe> get randomFood => _randomFood.stream;
  Stream<List<FoodRecipe>> get listRecipeByCate => _listFood.stream;
  Stream<FoodRecipe> get foodById => _foodById.stream;
  List<FoodCategory> foodCategories;
  FoodRecipe foodRandom;
  List<FoodRecipe> foodSearch;
  FoodRecipe foodDetail;
  getListCategory() async {
    foodCategories = await _getCategories(NoParams());
    _categoriesList.sink.add(foodCategories);
  }

  getRandomRecipe() async {
    foodRandom = await _getRandomRecipe(NoParams());
    _randomFood.sink.add(foodRandom);
  }

  getRecipeByCategory(String cate) async {
    foodSearch = await _getRecipesByCate(GetRecipesByCateParams(cate: cate));
    _listFood.sink.add(foodSearch);
  }

  getRecipeById(FoodRecipe recipe, bool isLoaded) async {
    foodDetail = null;
    if (!isLoaded) {
      foodDetail = await _getRecipeById(GetRecipeByIdParams(id: recipe.id));
    } else
      foodDetail = recipe;
    _foodById.sink.add(foodDetail);
  }

  Future<bool> saveRecipe(FoodRecipe recipe) async {    
    return await _addRecipe(AddRecipeParams(recipe: recipe));
  }

  dispose() {
    _categoriesList.close();
    _randomFood.close();
    _listFood.close();
    _foodById.close();
  }
}
