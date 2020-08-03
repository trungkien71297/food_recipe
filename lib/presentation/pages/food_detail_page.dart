import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_recipe/domain/models/food_recipe.dart';
import 'package:food_recipe/presentation/blocs/food_recipe_bloc.dart';
import 'package:food_recipe/presentation/common.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FoodDetailPage extends StatefulWidget {
  final FoodRecipe foodRecipe;
  static const ROUTE_NAME = "FoodDetailPage";

  FoodDetailPage({Key key, this.foodRecipe}) : super(key: key);

  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  ScrollController _scrollController;
  FoodRecipe foodTmp;
  YoutubePlayerController _ytController;
  FoodRecipeBloc bloc;
  bool _collapseInstruc = false;
  bool _collapseYoutube = false;
  bool _loaded = false;

  List<Widget> _ingredients(FoodRecipe food) {
    List<Widget> list = [];
    food.recipe.forEach((key, value) {
      list.add(ListTile(
        title: Text(
          key,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(value),
      ));
    });
    return list;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Future<void> didChangeDependencies() async {
    bloc = Provider.of<FoodRecipeBloc>(context);
    _scrollController = ScrollController(
        initialScrollOffset:
            MediaQuery.of(context).size.height / 3 - kToolbarHeight);
    Map<String, Object> arguments = ModalRoute.of(context).settings.arguments;
    foodTmp = arguments['item'];
    _loaded = arguments['isLoaded'];
    bloc.getRecipeById(foodTmp, _loaded);
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
                      foodTmp.name,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  actions: <Widget>[
                    InkWell(
                      onTap: ()async{
                        var res = await bloc.saveRecipe(foodTmp);
                        if(res){
                          var snackBar = SnackBar(content: Text("Saved"));
                          Scaffold.of(ctx).showSnackBar(snackBar);
                        } else {
                          var snackBar = SnackBar(content: Text("Failed"));
                          Scaffold.of(ctx).showSnackBar(snackBar);
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.favorite,
                          size: 40,
                        ),
                      ),
                    )
                  ],
                  flexibleSpace: Stack(
                    children: <Widget>[
                      Positioned.fill(
                          child: Hero(
                        tag: foodTmp.id,
                        child: Image.network(
                          foodTmp.thumb,
                          fit: BoxFit.cover,
                        ),
                      )),
                    ],
                  ),
                )
              ];
            },
            body: StreamBuilder(
                stream: bloc.foodById,
                initialData: bloc.foodDetail,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var food = snapshot.data as FoodRecipe;
                    foodTmp = food;
                    if (food.youtube != "") {
                      _ytController = YoutubePlayerController(
                        initialVideoId: videoId(food.youtube), //food.youtube
                        flags: YoutubePlayerFlags(
                          autoPlay: false,
                          mute: true,
                        ),
                      );
                    }
                    return ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        ExpansionPanelList(
                          expansionCallback: (panelIndex, isExpanded) {
                            switch (panelIndex) {
                              case 0:
                                setState(() {
                                  _collapseInstruc = !isExpanded;
                                });
                                break;
                              case 1:
                                setState(() {
                                  _collapseYoutube = !isExpanded;
                                });
                                if (_collapseYoutube) {
                                  _ytController.pause();
                                }
                                break;
                              default:
                            }
                            {}
                          },
                          animationDuration: Duration(milliseconds: 500),
                          children: [
                            ExpansionPanel(
                                headerBuilder: (context, isExpanded) => Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Instructrions",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ),
                                canTapOnHeader: true,
                                isExpanded: _collapseInstruc,
                                body: ListTile(
                                  title: Text("\t\t\t" +
                                      formatDescription(food.instructions)),
                                )),
                            ExpansionPanel(
                                headerBuilder: (context, isExpanded) => Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Video",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              PopupMenuButton(
                                                onSelected: (value) {
                                                  if (value == 'open_with') {
                                                    launch(food.youtube);
                                                  }
                                                },
                                                itemBuilder: (context) {
                                                  return [
                                                    PopupMenuItem(
                                                        value: "open_with",
                                                        child: Text(
                                                            'Open with youtube'))
                                                  ];
                                                },
                                                child: Icon(Icons.more_vert),
                                              )
                                            ],
                                          )),
                                    ),
                                canTapOnHeader: true,
                                isExpanded: _collapseYoutube,
                                body: ListTile(
                                    title: Card(
                                  elevation: 5,
                                  margin: EdgeInsets.all(10),
                                  child: YoutubePlayer(
                                    controller: _ytController,
                                    showVideoProgressIndicator: true,
                                    progressColors: ProgressBarColors(
                                        playedColor: Colors.amber),
                                    bottomActions: [
                                      CurrentPosition(),
                                      ProgressBar(isExpanded: true),
                                    ],
                                  ),
                                ))),
                          ],
                        ),
                        ..._ingredients(food)
                      ],
                    );
                  } else
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                        strokeWidth: 4,
                      ),
                    );
                })));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _ytController.dispose();
    super.dispose();
  }
}
