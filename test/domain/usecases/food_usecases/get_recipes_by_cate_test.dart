import 'package:flutter_test/flutter_test.dart';
import 'package:food_recipe/domain/models/food_recipe.dart';
import 'package:food_recipe/domain/repository/food_repository.dart';
import 'package:food_recipe/domain/usecases/food_usecases/get_recipes_by_cate.dart';
import 'package:mockito/mockito.dart';

class MockFoodRepository extends Mock implements FoodRepository {}

main() {
  GetRecipesByCate usecase;
  MockFoodRepository repository;

  setUp(() {
    repository = MockFoodRepository();
    usecase = GetRecipesByCate(repository: repository);
  });

  List<FoodRecipe> foodRecipes = [
    FoodRecipe(
        id: '1234',
        area: 'Vietnam',
        category: 'SeaFood',
        instructions:
            "Preheat oven to 350° F. Spray a 9x13-inch baking pan with non-stick spray.\r\nCombine soy sauce, ½ cup water, brown sugar, ginger and garlic in a small saucepan and cover. Bring to a boil over medium heat. Remove lid and cook for one minute once boiling.\r\nMeanwhile, stir together the corn starch and 2 tablespoons of water in a separate dish until smooth. Once sauce is boiling, add mixture to the saucepan and stir to combine. Cook until the sauce starts to thicken then remove from heat.\r\nPlace the chicken breasts in the prepared pan.",
        name: "Teriyaki Chicken Casserole",
        source: 'google',
        tags: "Meat,Casserole",
        thumb: "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg",
        youtube: "https://www.youtube.com/watch?v=4aZr5hZXP_s",
        recipe: {'soy sauce': "3/4 cup", "brown sugar": "1/4 cup"}),
    FoodRecipe(
        id: '3214',
        area: 'Vietnam',
        category: 'SeaFood',
        instructions:
            "Preheat oven to 350° F. Spray a 9x13-inch baking pan with non-stick spray.\r\nCombine soy sauce, ½ cup water, brown sugar, ginger and garlic in a small saucepan and cover. Bring to a boil over medium heat. Remove lid and cook for one minute once boiling.\r\nMeanwhile, stir together the corn starch and 2 tablespoons of water in a separate dish until smooth. Once sauce is boiling, add mixture to the saucepan and stir to combine. Cook until the sauce starts to thicken then remove from heat.\r\nPlace the chicken breasts in the prepared pan.",
        name: "Teriyaki Chicken Casserole",
        source: 'google',
        tags: "Meat,Casserole",
        thumb: "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg",
        youtube: "https://www.youtube.com/watch?v=4aZr5hZXP_s",
        recipe: {'soy sauce': "3/4 cup", "brown sugar": "1/4 cup"}),
    FoodRecipe(
        id: '5436',
        area: 'Vietnam',
        category: 'SeaFood',
        instructions:
            "Preheat oven to 350° F. Spray a 9x13-inch baking pan with non-stick spray.\r\nCombine soy sauce, ½ cup water, brown sugar, ginger and garlic in a small saucepan and cover. Bring to a boil over medium heat. Remove lid and cook for one minute once boiling.\r\nMeanwhile, stir together the corn starch and 2 tablespoons of water in a separate dish until smooth. Once sauce is boiling, add mixture to the saucepan and stir to combine. Cook until the sauce starts to thicken then remove from heat.\r\nPlace the chicken breasts in the prepared pan.",
        name: "Teriyaki Chicken Casserole",
        source: 'google',
        tags: "Meat,Casserole",
        thumb: "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg",
        youtube: "https://www.youtube.com/watch?v=4aZr5hZXP_s",
        recipe: {'soy sauce': "3/4 cup", "brown sugar": "1/4 cup"}),
    FoodRecipe(
        id: '76445',
        area: 'Vietnam',
        category: 'SeaFood',
        instructions:
            "Preheat oven to 350° F. Spray a 9x13-inch baking pan with non-stick spray.\r\nCombine soy sauce, ½ cup water, brown sugar, ginger and garlic in a small saucepan and cover. Bring to a boil over medium heat. Remove lid and cook for one minute once boiling.\r\nMeanwhile, stir together the corn starch and 2 tablespoons of water in a separate dish until smooth. Once sauce is boiling, add mixture to the saucepan and stir to combine. Cook until the sauce starts to thicken then remove from heat.\r\nPlace the chicken breasts in the prepared pan.",
        name: "Teriyaki Chicken Casserole",
        source: 'google',
        tags: "Meat,Casserole",
        thumb: "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg",
        youtube: "https://www.youtube.com/watch?v=4aZr5hZXP_s",
        recipe: {'soy sauce': "3/4 cup", "brown sugar": "1/4 cup"}),
    FoodRecipe(
        id: '8756',
        area: 'Vietnam',
        category: 'SeaFood',
        instructions:
            "Preheat oven to 350° F. Spray a 9x13-inch baking pan with non-stick spray.\r\nCombine soy sauce, ½ cup water, brown sugar, ginger and garlic in a small saucepan and cover. Bring to a boil over medium heat. Remove lid and cook for one minute once boiling.\r\nMeanwhile, stir together the corn starch and 2 tablespoons of water in a separate dish until smooth. Once sauce is boiling, add mixture to the saucepan and stir to combine. Cook until the sauce starts to thicken then remove from heat.\r\nPlace the chicken breasts in the prepared pan.",
        name: "Teriyaki Chicken Casserole",
        source: 'google',
        tags: "Meat,Casserole",
        thumb: "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg",
        youtube: "https://www.youtube.com/watch?v=4aZr5hZXP_s",
        recipe: {'soy sauce': "3/4 cup", "brown sugar": "1/4 cup"})
  ];
  final params = Params(cate: 'SeaFood');

  test('get list recipes by cate', () async {
    when(repository.getRecipesByCate(params.cate))
        .thenAnswer((_) async => foodRecipes);
    final result = await usecase(params);

    expect(result, foodRecipes);
    verify(repository.getRecipesByCate(params.cate));
  });
}
