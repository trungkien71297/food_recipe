import 'package:food_recipe/infrastructure/models/mappers.dart';
import 'package:get_it/get_it.dart';
import 'package:food_recipe/domain/repository/food_repository.dart';
import 'package:food_recipe/domain/usecases/food_usecases/get_categories.dart';
import 'package:food_recipe/domain/usecases/food_usecases/get_random_recipe.dart';
import 'package:food_recipe/domain/usecases/food_usecases/get_recipe_by_id.dart';
import 'package:food_recipe/domain/usecases/food_usecases/get_recipes_by_cate.dart';
import 'package:food_recipe/infrastructure/api/api.dart';
import 'package:food_recipe/infrastructure/local_data/local.dart';
import 'package:food_recipe/infrastructure/repository/food_repository_impl.dart';
import 'package:food_recipe/presentation/blocs/food_recipe_bloc.dart';

final getIt = GetIt.instance;

init() {
  getIt.registerFactory(() => FoodRecipeBloc(
      getCategories: getIt(),
      getRandomRecipe: getIt(),
      getRecipeById: getIt(),
      getRecipesByCate: getIt()));
  ////usescases
  getIt.registerLazySingleton(() => GetCategories(repository: getIt()));
  getIt.registerLazySingleton(() => GetRandomRecipe(repository: getIt()));
  getIt.registerLazySingleton(() => GetRecipeById(repository: getIt()));
  getIt.registerLazySingleton(() => GetRecipesByCate(repository: getIt()));

  ///repository
  getIt.registerLazySingleton<FoodRepository>(
      () => FoodRepositoryImpl(api: getIt(), local: getIt(), mappers: getIt()));
  ////
  getIt.registerLazySingleton(() => API());
  getIt.registerLazySingleton(() => Local());
  getIt.registerLazySingleton(() => Mappers());
}
