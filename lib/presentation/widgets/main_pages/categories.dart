import 'package:flutter/material.dart';
import 'package:food_recipe/domain/models/food_category.dart';
import 'package:food_recipe/presentation/blocs/food_recipe_bloc.dart';
import 'package:food_recipe/presentation/widgets/category_item.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories>
    with AutomaticKeepAliveClientMixin {
  FoodRecipeBloc bloc;
  bool loaded = false;

  @override
  void didChangeDependencies() {
    bloc = Provider.of<FoodRecipeBloc>(context);
    if (!loaded) {
      bloc.getListCategory();
      loaded = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return StreamBuilder(
        initialData: bloc.foodCategories,
        stream: bloc.categoriesList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data as List<FoodCategory>;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return CategoryItem(
                  category: data[index],
                );
              },
            );
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
