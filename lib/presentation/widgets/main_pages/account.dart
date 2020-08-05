import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_recipe/domain/models/food_recipe.dart';
import 'package:food_recipe/presentation/blocs/food_recipe_bloc.dart';
import 'package:food_recipe/presentation/pages/food_detail_page.dart';
import 'package:provider/provider.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> with AutomaticKeepAliveClientMixin {
  FoodRecipeBloc bloc;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    bloc = Provider.of(context);
    bloc.getFavorite();
    return StreamBuilder(
        stream: bloc.listFavorite,
        initialData: bloc.favoriteList,
        builder: (context, snapshot) {
          var list = snapshot.data as List<FoodRecipe>;
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 5),
              itemBuilder: (context, index) => InkWell(
                onTap: () => Navigator.of(context).pushNamed(FoodDetailPage.ROUTE_NAME, arguments: {"isLoaded": false,"item": list[index]}),
                              child: Container(
                    color: Colors.white,
                    child: Center(child: Text(list[index].name))),
              ),
              itemCount: list.length,
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

class Sticker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SvgPicture.asset("assets/svg/corona1.svg"),
    );
  }
}
