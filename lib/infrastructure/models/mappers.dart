import 'package:food_recipe/domain/models/food_category.dart';
import 'package:food_recipe/domain/models/food_recipe.dart';
import 'package:food_recipe/infrastructure/models/category_infra.dart';
import 'package:food_recipe/infrastructure/models/food_recipe_infra.dart';

class Mappers {
  FoodCategory categoryToDomain(CategoryInfra category) => FoodCategory(
      id: category.idCategory,
      description: category.strCategoryDescription,
      name: category.strCategory,
      thumb: category.strCategoryThumb);

  FoodRecipe foodRecipeToDomain(FoodRecipeInfra food, bool saved) {
    Map<String, String> recipes = {};
    if (food.recipeInMap == null) {
      if (food.strIngredient1 != null)
        recipes.addAll({food.strIngredient1: food.strMeasure1});
      if (food.strIngredient2 != null)
        recipes.addAll({food.strIngredient2: food.strMeasure2});
      if (food.strIngredient3 != null)
        recipes.addAll({food.strIngredient3: food.strMeasure3});
      if (food.strIngredient4 != null)
        recipes.addAll({food.strIngredient4: food.strMeasure4});
      if (food.strIngredient5 != null)
        recipes.addAll({food.strIngredient5: food.strMeasure5});
      if (food.strIngredient6 != null)
        recipes.addAll({food.strIngredient6: food.strMeasure6});
      if (food.strIngredient7 != null)
        recipes.addAll({food.strIngredient7: food.strMeasure7});
      if (food.strIngredient8 != null)
        recipes.addAll({food.strIngredient8: food.strMeasure8});
      if (food.strIngredient9 != null)
        recipes.addAll({food.strIngredient9: food.strMeasure9});
      if (food.strIngredient10 != null)
        recipes.addAll({food.strIngredient10: food.strMeasure10});
      if (food.strIngredient11 != null)
        recipes.addAll({food.strIngredient11: food.strMeasure11});
      if (food.strIngredient12 != null)
        recipes.addAll({food.strIngredient12: food.strMeasure12});
      if (food.strIngredient13 != null)
        recipes.addAll({food.strIngredient13: food.strMeasure13});
      if (food.strIngredient14 != null)
        recipes.addAll({food.strIngredient14: food.strMeasure14});
      if (food.strIngredient15 != null)
        recipes.addAll({food.strIngredient15: food.strMeasure15});
      if (food.strIngredient16 != null)
        recipes.addAll({food.strIngredient16: food.strMeasure16});
      if (food.strIngredient17 != null)
        recipes.addAll({food.strIngredient17: food.strMeasure17});
      if (food.strIngredient18 != null)
        recipes.addAll({food.strIngredient18: food.strMeasure18});
      if (food.strIngredient19 != null)
        recipes.addAll({food.strIngredient19: food.strMeasure19});
      if (food.strIngredient20 != null)
        recipes.addAll({food.strIngredient20: food.strMeasure20});
    } else recipes = food.recipeInMap;

    return FoodRecipe(
        id: food.idMeal,
        area: food.strArea,
        category: food.strCategory,
        instructions: food.strInstructions,
        name: food.strMeal,
        source: food.strSource,
        tags: food.strTags ?? "",
        thumb: food.strMealThumb,
        youtube: food.strYoutube ?? "",
        isSaved: saved,
        recipe: recipes);
  }

  FoodRecipeInfra foodRecipeToInfra(FoodRecipe food) => FoodRecipeInfra(
      idMeal: food.id,
      strArea: food.area,
      strCategory: food.category,
      strInstructions: food.instructions,
      strMeal: food.name,
      strSource: food.source,
      strTags: food.tags ?? "",
      strMealThumb: food.thumb,
      strYoutube: food.youtube ?? "",
      recipeInMap: food.recipe
    );
}
