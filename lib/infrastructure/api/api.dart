import 'package:http/http.dart' as http;

class API {
  final client = http.Client();
  Future<http.Response> getCategories() async {
    return await client
        .get("https://www.themealdb.com/api/json/v1/1/categories.php");
  }

  Future<http.Response> getRandomRecipe() async {
    return await client
        .get("https://www.themealdb.com/api/json/v1/1/random.php");
  }

  Future<http.Response> getRecipesByCate(String cate) async {
    return await client
        .get("https://www.themealdb.com/api/json/v1/1/filter.php?c=$cate");
  }

  Future<http.Response> getRecipeById(String id) async {
    return await client
        .get("https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id");
  }
}
