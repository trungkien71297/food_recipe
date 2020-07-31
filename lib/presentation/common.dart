import 'package:youtube_player_flutter/youtube_player_flutter.dart';

String videoId(String url) {
  return YoutubePlayer.convertUrlToId(url);
}

String formatDescription(String text){
  print(text.replaceAll("\r\n",'\t\t\t\r\n'));
  return text.replaceAll("\r\n",'\r\n\t\t\t');
}