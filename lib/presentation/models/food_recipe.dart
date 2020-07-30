class FoodRecipe {
  final String id;
  final String name;
  final String category;
  final String area;
  final String instructions;
  final String thumb;
  final String youtube;
  final String source;
  final Map<String, String> recipe;

  FoodRecipe(this.id, this.name, this.category, this.area, this.instructions,
      this.thumb, this.youtube, this.source, this.recipe);
}
