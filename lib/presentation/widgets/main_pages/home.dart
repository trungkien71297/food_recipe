import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jokes/presentation/pages/food_detail.dart';

class Home extends StatelessWidget {
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
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover)),
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
          Navigator.pushNamed(context, FoodDetail.ROUTE_NAME);
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
                  child: Image.network(
                    'https://www.themealdb.com/images/media/meals/wtqrqw1511639627.jpg',
                    fit: BoxFit.cover,
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
