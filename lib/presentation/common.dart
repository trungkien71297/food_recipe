import 'package:youtube_player_flutter/youtube_player_flutter.dart';

String videoId(String url) {
  return YoutubePlayer.convertUrlToId(url);
}

String formatDescription(String text) {
  return text.replaceAll("\r\n", '\r\n\t\t\t');
}
