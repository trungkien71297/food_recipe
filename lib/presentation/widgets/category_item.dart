import 'package:flutter/material.dart';
import 'package:food_recipe/domain/models/food_category.dart';
import 'package:food_recipe/presentation/pages/category_detail_page.dart';

class CategoryItem extends StatelessWidget {
  final FoodCategory category;

  CategoryItem({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(CategoryDetailPage.ROUTE_NAME,
            arguments: {'category': category});
      },
      child: Card(
          elevation: 3,
          color: Colors.grey.withOpacity(0.3),
          child: Container(
            height: 180,
            padding: EdgeInsets.only(bottom: 5, top: 5),
            child: Column(
              children: [
                Hero(
                  tag: category.name,
                  child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                category.thumb,
                              ),
                              fit: BoxFit.contain))),
                ),
                Text(category.name,
                    style: TextStyle(fontSize: 20, color: Colors.white70))
              ],
            ),
          )),
    );
  }
}
