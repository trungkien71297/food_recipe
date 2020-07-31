import 'package:http/http.dart' as http;

class API {
  final client = http.Client();
  Future<http.Response> getCategories() async {
    return await client
        .get("https://www.themealdb.com/api/json/v1/1/categories.php");
  }
}
