import 'package:flutter/material.dart';
import 'package:jokes/presentation/models/category_detail_view.dart';
import 'package:jokes/presentation/pages/category_detail_page.dart';

class CategoryItem extends StatelessWidget {
  final CategoryDetailView category;

  CategoryItem({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(CategoryDetailPage.ROUTE_NAME, arguments: {'category':category});
      },
      child: Card(
          elevation: 3,
          color: Colors.grey.withOpacity(0.3),
          child: Container(
            height: 180,
            padding: EdgeInsets.only(bottom: 5),
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
                Text("Vega",
                    style: TextStyle(fontSize: 20, color: Colors.white70))
              ],
            ),
          )),
    );
  }
}
