import 'package:equatable/equatable.dart';
import 'package:food_recipe/domain/models/food_recipe.dart';
import 'package:food_recipe/domain/repository/food_repository.dart';
import 'package:food_recipe/domain/usecases/usecase.dart';

class GetRecipesByCate extends Usecase<List<FoodRecipe>, GetRecipesByCateParams> {
  final FoodRepository repository;

  GetRecipesByCate({this.repository});

  @override
  Future<List<FoodRecipe>> call(GetRecipesByCateParams params) async {
    return await repository.getRecipesByCate(params.cate);
  }
}

class GetRecipesByCateParams extends Equatable {
  final String cate;

  GetRecipesByCateParams({this.cate});

  @override
  List<Object> get props => [this.cate];
}
