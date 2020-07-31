import 'package:flutter/material.dart';
import 'package:food_recipe/presentation/pages/category_detail_page.dart';
import 'package:food_recipe/presentation/pages/food_detail_page.dart';
import 'package:food_recipe/presentation/pages/main_page.dart';
import 'di/di.dart' as di;

void main() {
  di.init();
  runApp(JokeApp());
}

class JokeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.red,
          backgroundColor: Colors.black,
          appBarTheme: AppBarTheme(color: Colors.grey.withOpacity(0.5))),
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(),
        FoodDetailPage.ROUTE_NAME: (context) => FoodDetailPage(),
        CategoryDetailPage.ROUTE_NAME: (context) => CategoryDetailPage()
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case FoodDetailPage.ROUTE_NAME:
            return _createRoute(FoodDetailPage());
            break;
          case CategoryDetailPage.ROUTE_NAME:
            return _createRoute(CategoryDetailPage());
            break;
          default:
            return _createRoute(MainPage());
        }
      },
    );
  }
}

Route _createRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var tween = Tween(begin: begin, end: end);
      // var offsetAnimation = animation.drive(tween);
      return SlideTransition(
        position: tween.animate(animation),
        child: child,
      );
    },
  );
}
