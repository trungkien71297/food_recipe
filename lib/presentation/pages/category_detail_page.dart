import 'package:flutter/material.dart';
import 'package:food_recipe/domain/models/food_category.dart';
import 'package:food_recipe/presentation/common.dart';
import 'package:food_recipe/presentation/widgets/list_foods.dart';

class CategoryDetailPage extends StatefulWidget {
  static const ROUTE_NAME = "CategoryDetailPage";

  @override
  _CategoryDetailPageState createState() => _CategoryDetailPageState();
}

class _CategoryDetailPageState extends State<CategoryDetailPage> {
  ScrollController _scrollController;
  FoodCategory category;
  bool _collapse = true;
  @override
  void didChangeDependencies() {
    var initOffset = MediaQuery.of(context).size.height / 3;
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
    Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
    category = args['category'];
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
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.favorite,
                    size: 40,
                  ),
                )
              ],
              // title: Text("Eccles Cakes"),
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
          Expanded(child: ListFoods()),
        ]),
      ),
    );
  }
}
