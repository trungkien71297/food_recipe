import 'package:flutter/material.dart';
import 'package:jokes/presentation/common.dart';
import 'package:jokes/presentation/widgets/list_foods.dart';

class CategoryDetailPage extends StatefulWidget {
  static const ROUTE_NAME = "CategoryDetailPage";

  @override
  _CategoryDetailPageState createState() => _CategoryDetailPageState();
}

class _CategoryDetailPageState extends State<CategoryDetailPage> {
  ScrollController _scrollController;
  bool _collapse = false;
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
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (ctx, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              floating: false,
              snap: false,
              expandedHeight: MediaQuery.of(ctx).size.height / 3,
              centerTitle: true,
              title: Center(
                child: Text(
                  "Eccles Cakes",
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
                      "https://www.themealdb.com/images/media/meals/wtqrqw1511639627.jpg",
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
                    child: Align(alignment: Alignment.centerLeft,child: Text("Description", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                  ),
                  canTapOnHeader: true,
                  isExpanded: _collapse,
                  body: ListTile(
                    title: Text("\t\t\t"+formatDescription("Dessert is a course that concludes a meal. The course usually consists of sweet foods, such as confections dishes or fruit, and possibly a beverage such as dessert wine or liqueur, however in the United States it may include coffee, cheeses, nuts, or other savory items regarded as a separate course elsewhere. In some parts of the world, such as much of central and western Africa, and most parts of China, there is no tradition of a dessert course to conclude a meal.\r\n\r\nThe term dessert can apply to many confections, such as biscuits, cakes, cookies, custards, gelatins, ice creams, pastries, pies, puddings, and sweet soups, and tarts. Fruit is also commonly found in dessert courses because of its naturally occurring sweetness. Some cultures sweeten foods that are more commonly savory to create desserts.")),
                  ))
            ],
          ),
          Expanded(child: ListFoods()),
        ]),
      ),
    );
  }
}
