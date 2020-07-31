import 'package:flutter/material.dart';
import 'package:food_recipe/presentation/models/food_recipe_view.dart';
import 'package:food_recipe/presentation/pages/food_detail_page.dart';

class FoodItem extends StatelessWidget {
  final FoodRecipeView foodItem;

  FoodItem({Key key, this.foodItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(FoodDetailPage.ROUTE_NAME,
          arguments: {'item': foodItem, 'isLoaded': false}),
      child: Container(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Hero(
            tag: foodItem.id,
            child: Image.network(
              foodItem.thumb,
              cacheWidth: 500,
              fit: BoxFit.fitWidth,
            ),
          ),
          Text(
            foodItem.name,
            style: TextStyle(fontSize: 20, color: Colors.black),
          )
        ]),
      ),
    );
  }
}
