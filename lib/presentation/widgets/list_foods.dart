import 'package:flutter/material.dart';
import 'package:food_recipe/domain/models/food_recipe.dart';
import 'package:food_recipe/presentation/widgets/food_item.dart';

class ListFoods extends StatelessWidget {
  final List<FoodRecipe> foods;

  ListFoods({Key key, this.foods}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(foods.length > 0){
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
    } else return Center(child: Text("No data"),);
  }
}
