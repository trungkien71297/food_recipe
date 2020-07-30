import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jokes/presentation/models/food_recipe.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FoodDetail extends StatelessWidget {
  final FoodRecipe foodRecipe;
  static const ROUTE_NAME = "FoodDetail";

  FoodDetail({Key key, this.foodRecipe}) : super(key: key);

  // YoutubePlayerController _ytController = YoutubePlayerController(
  //   initialVideoId: 'xV0QCJ0GD5w',
  //   flags: YoutubePlayerFlags(
  //     autoPlay: true,
  //     mute: true,
  //   ),
  // );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (ctx, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  pinned: true,
                  floating: true,
                  snap: true,
                  expandedHeight: MediaQuery.of(ctx).size.height / 3,
                  centerTitle: true,
                  title: Center(
                    child: Text(
                      "Eccles Cakes",
                      style: TextStyle(fontSize: 50, color: Colors.white),
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
                          child: Image.network(
                        "https://www.themealdb.com/images/media/meals/wtqrqw1511639627.jpg",
                        fit: BoxFit.cover,
                      )),
                    ],
                  ),

                  //  FlexibleSpaceBar(
                  //   background: Image.network(
                  //       "https://www.themealdb.com/images/media/meals/wtqrqw1511639627.jpg",
                  //       fit: BoxFit.cover),
                  // ),
                )
              ];
            },
            body: Container(
                color: Colors.yellow,
                child: WebView(
                  initialUrl: Uri.dataFromString(
                          '<html><body><iframe src="https://www.youtube.com/embed/xV0QCJ0GD5w" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></body></html<>',
                          mimeType: 'text/html')
                      .toString(),
                  javascriptMode: JavascriptMode.unrestricted,
                )
                // YoutubePlayer(
                //   controller: _ytController,
                //   showVideoProgressIndicator: true,
                //   progressColors: ProgressBarColors(playedColor: Colors.amber),
                //   onReady: () {
                //     print("Ready");
                //   },
                //   onEnded: (metaData) => print(metaData.toString()),
                // ),
                )));
  }
}
