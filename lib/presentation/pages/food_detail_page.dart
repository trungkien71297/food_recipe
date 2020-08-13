import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_recipe/domain/models/food_recipe.dart';
import 'package:food_recipe/presentation/blocs/food_recipe_bloc.dart';
import 'package:food_recipe/presentation/common.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FoodDetailPage extends StatefulWidget {
  final FoodRecipe foodRecipe;
  static const ROUTE_NAME = "FoodDetailPage";

  FoodDetailPage({Key key, this.foodRecipe}) : super(key: key);

  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> with AutomaticKeepAliveClientMixin{
  ScrollController _scrollController;
  FoodRecipe foodTmp;
  FoodRecipeBloc bloc;
  bool _collapseInstruc = false;
  bool _collapseYoutube = false;
  // bool _loaded = false;
  bool _isSaved = false;
  ValueNotifier<bool> saved = ValueNotifier(false);

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
    // _loaded = arguments['isLoaded'];
    bloc.getRecipeById(foodTmp, false);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        body: StreamBuilder(
            initialData: bloc.foodDetail,
            stream: bloc.foodById,
            builder: (context, snapshot) {
              FoodRecipe food;
              YoutubePlayerController controller;
              if (snapshot.hasData) {
                food = snapshot.data as FoodRecipe;
                foodTmp = food;
                _isSaved = food.isSaved;
                saved.value = _isSaved;
                if (food.youtube != "") {
                  controller = YoutubePlayerController(
                      initialVideoId: videoId(food.youtube),
                      flags: YoutubePlayerFlags(
                        autoPlay: false,
                        mute: false,
                      ));
                  controller.addListener(() {
                    print("Mo no");
                    print(controller.metadata);
                  });
                }
              }

              return NestedScrollView(
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
                            onTap: () async {
                              bool res;
                              if (!_isSaved)
                                res = await bloc.saveRecipe(foodTmp);
                              else
                                res = await bloc.removeRecipe(foodTmp.id);
                              if (res) {
                                _isSaved = !_isSaved;
                                saved.value = _isSaved;
                                Scaffold.of(context).removeCurrentSnackBar();
                                var snackBar =
                                    SnackBar(content: Text("Success"));
                                Scaffold.of(ctx).showSnackBar(snackBar);
                              } else {
                                Scaffold.of(context).removeCurrentSnackBar();
                                var snackBar =
                                    SnackBar(content: Text("Failed"));
                                Scaffold.of(ctx).showSnackBar(snackBar);
                              }
                            },
                            child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: ValueListenableBuilder(
                                  valueListenable: saved,
                                  builder: (context, value, child) {
                                    return value
                                        ? Icon(Icons.favorite)
                                        : Icon(Icons.favorite_border);
                                  },
                                )),
                          ),
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
                  body: snapshot.hasData
                      ? ListView(
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
                                    break;
                                  default:
                                }
                                {}
                              },
                              animationDuration: Duration(milliseconds: 500),
                              children: [
                                ExpansionPanel(
                                    headerBuilder: (context, isExpanded) =>
                                        Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "Instructrions",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                        ),
                                    canTapOnHeader: true,
                                    isExpanded: _collapseInstruc,
                                    body: ListTile(
                                      title: Text("\t\t\t" +
                                          formatDescription(food.instructions)),
                                    )),
                                if (food.youtube != "")
                                  ExpansionPanel(
                                      headerBuilder: (context, isExpanded) =>
                                          Padding(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Video",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    PopupMenuButton(
                                                      onSelected:
                                                          (value) async {
                                                        if (value ==
                                                            'open_with') {
                                                          await launch(
                                                              food.youtube);
                                                        }
                                                      },
                                                      itemBuilder: (context) {
                                                        return [
                                                          PopupMenuItem(
                                                              value:
                                                                  "open_with",
                                                              child: Text(
                                                                  'Open with youtube'))
                                                        ];
                                                      },
                                                      child:
                                                          Icon(Icons.more_vert),
                                                    )
                                                  ],
                                                )),
                                          ),
                                      canTapOnHeader: true,
                                      isExpanded: _collapseYoutube,
                                      body: Container(
                                        height: 300,
                                        child: Center(
                                          child: WebView(
                                            initialUrl: Uri.dataFromString(
                                                    videoIframe(food.youtube, MediaQuery.of(context).size),
                                                    mimeType: 'text/html')
                                                .toString(),
                                            javascriptMode:
                                                JavascriptMode.unrestricted,
                                          ),
                                        ),
                                      )),
                              ],
                            ),
                            ..._ingredients(food)
                          ],
                        )
                      : Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.white,
                            strokeWidth: 4,
                          ),
                        ));
            }));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
