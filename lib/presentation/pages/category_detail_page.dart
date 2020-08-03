import 'package:flutter/material.dart';
import 'package:food_recipe/domain/models/food_category.dart';
import 'package:food_recipe/presentation/common.dart';
import 'package:food_recipe/presentation/widgets/list_foods.dart';
import 'package:food_recipe/presentation/blocs/food_recipe_bloc.dart';
import 'package:provider/provider.dart';

class CategoryDetailPage extends StatefulWidget {
  static const ROUTE_NAME = "CategoryDetailPage";

  @override
  _CategoryDetailPageState createState() => _CategoryDetailPageState();
}

class _CategoryDetailPageState extends State<CategoryDetailPage> {
  ScrollController _scrollController;
  FoodCategory category;
  bool _collapse = true;
  FoodRecipeBloc bloc;

  @override
  void didChangeDependencies() {
    Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
    category = args['category'];
    bloc = Provider.of<FoodRecipeBloc>(context);
    var initOffset = MediaQuery.of(context).size.height / 3 - kToolbarHeight;
    _scrollController = ScrollController(initialScrollOffset: initOffset);
    _scrollController.addListener(() {
      if (_scrollController.offset > initOffset) {
        if (_collapse) {
          setState(() {
            _collapse = false;
          });
        }
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (ctx, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.black,
              pinned: true,
              floating: false,
              snap: false,
              expandedHeight: MediaQuery.of(ctx).size.height / 3,
              centerTitle: true,
              title: Center(
                child: Text(
                  category.name,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              flexibleSpace: Stack(
                children: <Widget>[
                  Positioned.fill(
                      child: Hero(
                    tag: "asc", //foodRecipe.thumb,
                    child: Image.network(
                      category.thumb,
                      fit: BoxFit.cover,
                    ),
                  )),
                ],
              ),
            )
          ];
        },
        body: Column(children: [
          ExpansionPanelList(
            expansionCallback: (panelIndex, isExpanded) {
              setState(() {
                _collapse = !isExpanded;
              });
            },
            animationDuration: Duration(milliseconds: 500),
            children: [
              ExpansionPanel(
                  headerBuilder: (context, isExpanded) => Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Description",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )),
                      ),
                  canTapOnHeader: true,
                  isExpanded: _collapse,
                  body: ListTile(
                    title: Text(
                        "\t\t\t" + formatDescription(category.description)),
                  ))
            ],
          ),
          Expanded(
              child: StreamBuilder(
                  stream: bloc.listRecipeByCate,
                  initialData: null,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      bloc.getRecipeByCategory(category.name);
                    }
                    if (snapshot.hasData) {
                      return ListFoods(
                        foods: snapshot.data,
                      );
                    } else
                      return Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          strokeWidth: 4,
                        ),
                      );
                  })),
        ]),
      ),
    );
  }
}
