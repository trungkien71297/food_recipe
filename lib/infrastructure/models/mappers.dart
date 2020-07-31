import 'package:food_recipe/domain/models/food_category.dart';
import 'package:food_recipe/infrastructure/models/category_infra.dart';

class Mappers {
  FoodCategory categoryToDomain(CategoryInfra category) => FoodCategory(
      id: category.idCategory,
      description: category.strCategoryDescription,
      name: category.strCategory,
      thumb: category.strCategoryThumb);
}
