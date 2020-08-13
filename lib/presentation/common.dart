import 'dart:ui';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

String videoId(String url) {
  return YoutubePlayer.convertUrlToId(url);
}

String videoIframe(String url, Size screensize) {
  var width = screensize.width - 15;
  var height = width*9/16;
  var id = YoutubePlayer.convertUrlToId(url);
  var ifr = '<iframe id="ytplayer" type="text/html" width="$width" height="$height" src="https://www.youtube.com/embed/$id?autoplay=1" frameborder="0"></iframe>';
  return ifr;
}

String formatDescription(String text) {
  return text.replaceAll("\r\n", '\r\n\t\t\t');
}