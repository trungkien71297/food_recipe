import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String category;

  CategoryItem({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.6,
      color: Colors.grey.withOpacity(0.3),
      child: Container(
        child: Center(
            child: Text(
          category,
          style: TextStyle(fontSize: 30, color: Colors.white54),
        )),
        height: 100,
      ),
    );
  }
}
