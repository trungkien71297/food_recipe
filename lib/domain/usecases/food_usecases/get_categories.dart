import 'package:flutter/foundation.dart';
import 'package:jokes/domain/models/food_category.dart';
import 'package:jokes/domain/repository/food_repository.dart';
import 'package:jokes/domain/usecases/usecase.dart';

class GetCategories extends Usecase<List<FoodCategory>, NoParams> {
  final FoodRepository repository;

  GetCategories({@required this.repository});

  @override
  Future<List<FoodCategory>> call(NoParams params) async {
    return await repository.getCategories();
  }
}
