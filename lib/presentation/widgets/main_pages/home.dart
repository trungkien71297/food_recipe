import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_recipe/presentation/models/food_recipe_view.dart';
import 'package:food_recipe/presentation/pages/food_detail_page.dart';

class Home extends StatelessWidget {
  final food = FoodRecipeView(
      id: '1234',
      name: 'Escovitch Fish',
      category: 'Chicken',
      instructions:
          "Preheat the oven to 180°C/Gas mark 4. Have the chicken joints ready to cook. Heat the butter and 3 tbsp olive oil in a flameproof casserole or large frying pan. Brown the chicken pieces in batches on both sides, seasoning them with salt and pepper as you go. Don't crowd the pan - fry the chicken in small batches, removing the pieces to kitchen paper as they are done.\r\n\r\nAdd a little more olive oil to the casserole and fry the onions over a medium heat for 10 minutes, stirring frequently, until softened but not browned. Add the rest of the oil, then the peppers and cook for another 5 minutes.\r\n\r\nAdd the chorizo, sun-dried tomatoes and garlic and cook for 2-3 minutes. Add the rice, stirring to ensure it is well coated in the oil. Stir in the tomato paste, paprika, bay leaves and chopped thyme. Pour in the stock and wine. When the liquid starts to bubble, turn the heat down to a gentle simmer. Press the rice down into the liquid if it isn't already submerged and place the chicken on top. Add the lemon wedges and olives around the chicken.\r\n\r\nCover and cook in the oven for 50 minutes. The rice should be cooked but still have some bite, and the chicken should have juices that run clear when pierced in the thickest part with a knife. If not, cook for another 5 minutes and check again.",
      thumb: "https://www.themealdb.com/images/media/meals/1520084413.jpg",
      youtube: "https://www.youtube.com/watch?v=1IszT_guI08",
      source: "https://www.rivercottage.net/recipes/chicken-basquaise");
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            color: Colors.white.withOpacity(0),
          ),
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(food.thumb), fit: BoxFit.cover)),
      ),
      Align(
        alignment: Alignment(-0.7, -0.8),
        child: Text(
          "For you",
          style: TextStyle(
              color: Colors.white54, fontSize: 70, fontWeight: FontWeight.bold),
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.pushNamed(context, FoodDetailPage.ROUTE_NAME,
              arguments: {'item': food, 'isLoaded': true});
        },
        child: Align(
          alignment: Alignment(0.7, 0.2),
          child: Container(
            width: 400,
            height: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  "Eccles Cakes",
                  style: TextStyle(fontSize: 50, color: Colors.white70),
                ),
                Container(
                  height: 300,
                  width: 400,
                  child: Hero(
                    tag: food.id,
                    child: Image.network(
                      food.thumb,
                      fit: BoxFit.cover,
                      cacheHeight: 300,
                      cacheWidth: 400,
                    ),
                  ),
                ),
                Text(
                  "#Snack, #Treat",
                  style: TextStyle(fontSize: 20, color: Colors.white70),
                )
              ],
            ),
          ),
        ),
      )
    ]);
  }
}
