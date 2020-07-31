import 'package:flutter/material.dart';
import 'package:jokes/presentation/models/category_detail_view.dart';
import 'package:jokes/presentation/widgets/category_item.dart';

class Categories extends StatelessWidget {
  final List<CategoryDetailView> categories = List.generate(15, (index) => CategoryDetailView(
    description: "Beef is the culinary name for meat from cattle, particularly skeletal muscle. Humans have been eating beef since prehistoric times.[1] Beef is a source of high-quality protein and essential nutrients.[2]",
    name: "Beef" + index.toString(),
    thumb: "https://www.themealdb.com/images/category/beef.png"
  ));

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
