import 'package:flutter/material.dart';
import 'package:food_recipe/presentation/models/food_recipe_view.dart';
import 'package:food_recipe/presentation/widgets/food_item.dart';

class ListFoods extends StatelessWidget {
  final List<FoodRecipeView> foods = List.generate(
      14,
      (index) => FoodRecipeView(
          id: (1234 + index).toString(),
          name: 'Escovitch Fish',
          thumb:
              "https://www.themealdb.com/images/media/meals/1520084413.jpg"));
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: foods.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 2.5,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5),
      itemBuilder: (context, index) => FoodItem(
        foodItem: foods[index],
      ),
    );
  }
}
