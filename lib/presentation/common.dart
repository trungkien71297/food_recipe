import 'package:youtube_player_flutter/youtube_player_flutter.dart';

String videoId(String url) {
  return YoutubePlayer.convertUrlToId(url);
}

String videoIframe(String url) {
  var id = YoutubePlayer.convertUrlToId(url);
  var ifr = '<html><body><iframe src="https://www.youtube.com/embed/$id"></iframe></body></html>';
  return ifr;
}

String formatDescription(String text) {
  return text.replaceAll("\r\n", '\r\n\t\t\t');
}
