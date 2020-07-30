import 'package:flutter/material.dart';
import 'package:jokes/presentation/pages/food_detail.dart';
import 'package:jokes/presentation/pages/main_page.dart';

void main() {
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
        FoodDetail.ROUTE_NAME: (context) => FoodDetail()
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case FoodDetail.ROUTE_NAME:
            return _createRoute(FoodDetail());
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