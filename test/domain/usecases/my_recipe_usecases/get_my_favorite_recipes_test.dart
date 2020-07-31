import 'package:flutter_test/flutter_test.dart';
import 'package:food_recipe/domain/models/food_recipe.dart';
import 'package:food_recipe/domain/repository/myrecipes_repository.dart';
import 'package:food_recipe/domain/usecases/my_recipe_usecases/get_my_favorite_recipes.dart';
import 'package:food_recipe/domain/usecases/usecase.dart';
import 'package:mockito/mockito.dart';

class MockMyRecipesRepository extends Mock implements MyRecipesRepository {}

main() {
  GetMyFavoriterecipes usecase;
  MockMyRecipesRepository repository;

  setUp(() {
    repository = MockMyRecipesRepository();
    usecase = GetMyFavoriterecipes(repository: repository);
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

  test('get list of recipe from local', () async {
    when(repository.getMyFavoriteRecipes())
        .thenAnswer((_) async => foodRecipes);
    final result = await usecase(NoParams());

    expect(result, foodRecipes);
    verify(repository.getMyFavoriteRecipes());
  });
}
