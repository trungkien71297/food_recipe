import 'package:flutter_test/flutter_test.dart';
import 'package:jokes/domain/models/food_recipe.dart';
import 'package:jokes/domain/repository/myrecipes_repository.dart';
import 'package:jokes/domain/usecases/my_recipe_usecases/add_recipe.dart';
import 'package:mockito/mockito.dart';

class MockMyRecipesRepository extends Mock implements MyRecipesRepository {}

main() {
  AddRecipe usecase;
  MockMyRecipesRepository repository;

  setUp(() {
    repository = MockMyRecipesRepository();
    usecase = AddRecipe(repository: repository);
  });
  final food = FoodRecipe(
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
      recipe: {'soy sauce': "3/4 cup", "brown sugar": "1/4 cup"});
  final food2 = FoodRecipe(
      id: 'adascd',
      area: 'Vietnam',
      category: 'SeaFood',
      instructions:
          "Preheat oven to 350° F. Spray a 9x13-inch baking pan with non-stick spray.\r\nCombine soy sauce, ½ cup water, brown sugar, ginger and garlic in a small saucepan and cover. Bring to a boil over medium heat. Remove lid and cook for one minute once boiling.\r\nMeanwhile, stir together the corn starch and 2 tablespoons of water in a separate dish until smooth. Once sauce is boiling, add mixture to the saucepan and stir to combine. Cook until the sauce starts to thicken then remove from heat.\r\nPlace the chicken breasts in the prepared pan.",
      name: "Teriyaki Chicken Casserole",
      source: 'google',
      tags: "Meat,Casserole",
      thumb: "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg",
      youtube: "https://www.youtube.com/watch?v=4aZr5hZXP_s",
      recipe: {'soy sauce': "3/4 cup", "brown sugar": "1/4 cup"});
  test('add recipe', () async {
    when(repository.addRecipe(food)).thenAnswer((_) async => true);
    when(repository.addRecipe(food2)).thenAnswer((_) async => false);
    final result = await usecase(Params(recipe: food));
    final result2 = await usecase(Params(recipe: food2));
    expect(result, true);
    expect(result2, false);
    verify(repository.addRecipe(food));
    verify(repository.addRecipe(food2));
  });
}
