import 'dart:convert';

import 'package:food_recipe/domain/models/food_recipe.dart';
import 'package:food_recipe/domain/models/food_category.dart';
import 'package:food_recipe/domain/repository/food_repository.dart';
import 'package:food_recipe/infrastructure/api/api.dart';
import 'package:food_recipe/infrastructure/local_data/local.dart';
import 'package:food_recipe/infrastructure/models/category_infra.dart';
import 'package:food_recipe/infrastructure/models/food_recipe_infra.dart';
import 'package:food_recipe/infrastructure/models/mappers.dart';

class FoodRepositoryImpl extends FoodRepository {
  final API api;
  final Mappers mappers;
  final Local local;
  FoodRepositoryImpl({this.api, this.mappers, this.local});

  @override
  Future<List<FoodCategory>> getCategories() async {
    var response = await api.getCategories();
    var json = jsonDecode(response.body) as Map<String, dynamic>;
    List<dynamic> listCateJson = json['categories'];
    List<FoodCategory> categories = listCateJson
        .map((e) => mappers.categoryToDomain(CategoryInfra.fromJson(e)))
        .toList();

    return categories;
  }

  @override
  Future<FoodRecipe> getRandomRecipe() async {
    var response = await api.getRandomRecipe();
    var json = jsonDecode(response.body) as Map<String, dynamic>;
    List<dynamic> lst = json['meals'];
    if (lst.length > 0)
      return mappers.foodRecipeToDomain(FoodRecipeInfra.fromJson(lst[0]));
    else
      return null;
  }

  @override
  Future<FoodRecipe> getRecipeById(String id) {
    // TODO: implement getRecipeById
    throw UnimplementedError();
  }

  @override
  Future<List<FoodRecipe>> getRecipesByCate(String id) {
    // TODO: implement getRecipesByCate
    throw UnimplementedError();
  }
}
