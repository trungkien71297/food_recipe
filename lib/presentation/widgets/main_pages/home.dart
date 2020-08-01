import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_recipe/domain/models/food_recipe.dart';
import 'package:food_recipe/presentation/blocs/food_recipe_bloc.dart';
import 'package:food_recipe/presentation/pages/food_detail_page.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  FoodRecipeBloc bloc;
  bool loaded = false;
  FoodRecipe food;

  @override
  void didChangeDependencies() {
    bloc = Provider.of<FoodRecipeBloc>(context);
    if (!loaded) {
      bloc.getRandomRecipe();
      loaded = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return StreamBuilder(
        stream: bloc.randomFood,
        initialData: bloc.foodRandom,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            food = snapshot.data;
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
                      color: Colors.white54,
                      fontSize: 70,
                      fontWeight: FontWeight.bold),
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
                    height: 600,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          food.name,
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
                        if (food.tags != "")
                          Text(
                            "#" + food.tags.replaceAll(",", " #"),
                            style:
                                TextStyle(fontSize: 20, color: Colors.white70),
                          )
                      ],
                    ),
                  ),
                ),
              )
            ]);
          } else
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                strokeWidth: 4,
              ),
            );
        });
  }

  @override
  bool get wantKeepAlive => true;
}
