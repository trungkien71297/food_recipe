import 'dart:convert';

import 'package:food_recipe/domain/models/food_recipe.dart';
import 'package:food_recipe/domain/models/food_category.dart';
import 'package:food_recipe/domain/repository/food_repository.dart';
import 'package:food_recipe/domain/repository/myrecipes_repository.dart';
import 'package:food_recipe/infrastructure/api/api.dart';
import 'package:food_recipe/infrastructure/models/category_infra.dart';
import 'package:food_recipe/infrastructure/models/food_recipe_infra.dart';
import 'package:food_recipe/infrastructure/models/mappers.dart';

class FoodRepositoryImpl extends FoodRepository {
  final API api;
  final Mappers mappers;
  final MyRecipesRepository localRepository;
  FoodRepositoryImpl({this.api, this.mappers, this.localRepository});

  @override
  Future<List<FoodCategory>> getCategories() async {
    var response = await api.getCategories();
    var json = jsonDecode(response.body) as Map<String, dynamic>;
    return CategoriesListInfra.fromJson(json).categories.map((e) => mappers.categoryToDomain(e)).toList();
  }

  @override
  Future<FoodRecipe> getRandomRecipe() async {
    var response = await api.getRandomRecipe();
    var json = jsonDecode(response.body) as Map<String, dynamic>;
    ListFoodInfra list = ListFoodInfra.fromJson(json);
    if (list.meals.length > 0)
      return mappers.foodRecipeToDomain(list.meals[0]);
    else
      return null;
  }

  @override
  Future<FoodRecipe> getRecipeById(String id) async {
    var response = await api.getRecipeById(id);
    var json = jsonDecode(response.body) as Map<String, dynamic>;
    ListFoodInfra list = ListFoodInfra.fromJson(json);
    if (list.meals.length > 0)
      return mappers.foodRecipeToDomain(list.meals[0]);
    else
      return null;
  }

  @override
  Future<List<FoodRecipe>> getRecipesByCate(String cate) async {
    var response = await api.getRecipesByCate(cate);
    var json = jsonDecode(response.body) as Map<String, dynamic>;
    ListFoodInfra list = ListFoodInfra.fromJson(json);
    if (list.meals.length > 0)
      return list.meals.map((e) => mappers.foodRecipeToDomain(e)).toList();
    else
      return [];
  }
}
