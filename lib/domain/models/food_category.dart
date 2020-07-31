import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class FoodCategory extends Equatable {
  final String id;
  final String name;
  final String thumb;
  final String description;

  FoodCategory({@required this.id, this.name, this.thumb, this.description});

  @override
  List<Object> get props => [this.id, this.name, this.thumb, this.description];
}
