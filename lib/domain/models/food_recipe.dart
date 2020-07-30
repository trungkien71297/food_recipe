import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class FoodRecipe extends Equatable {
  final String id;
  final String name;
  final String category;
  final String area;
  final String instructions;
  final String thumb;
  final String tags;
  final String youtube;
  final String source;
  final Map<String, String> recipe;

  FoodRecipe(
      {@required this.id,
      this.name,
      this.category,
      this.area,
      this.instructions,
      this.thumb,
      this.tags,
      this.youtube,
      this.source,
      this.recipe});
  @override
  List<Object> get props => [
        this.id,
        this.name,
        this.category,
        this.area,
        this.instructions,
        this.thumb,
        this.tags,
        this.youtube,
        this.source,
        this.recipe
      ];
}
