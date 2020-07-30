import 'package:flutter/material.dart';
import 'package:jokes/presentation/widgets/category_item.dart';

class Categories extends StatelessWidget {
  final List<String> categories = [
    'Vegetarian',
    'Vegan',
    'Breakfast',
    'Vegetarian',
    'Vegan',
    'Breakfast',
    'Vegetarian',
    'Vegan',
    'Breakfast',
    'Vegetarian',
    'Vegan',
    'Breakfast',
    'Vegetarian',
    'Vegan',
    'Breakfast',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return CategoryItem(
          category: categories[index],
        );
      },
    );
  }
}
