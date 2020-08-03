import 'package:json_annotation/json_annotation.dart';
part 'category_infra.g.dart';

@JsonSerializable()
class CategoriesListInfra {
  List<CategoryInfra> categories;
  CategoriesListInfra({this.categories});
  factory CategoriesListInfra.fromJson(Map<String, dynamic> json) =>
      _$CategoriesListInfraFromJson(json);
  Map<String, dynamic> toJson() => _$CategoriesListInfraToJson(this);
}


@JsonSerializable()
class CategoryInfra {
  String idCategory;
  String strCategory;
  String strCategoryThumb;
  String strCategoryDescription;

  CategoryInfra(
      {this.idCategory,
      this.strCategory,
      this.strCategoryThumb,
      this.strCategoryDescription});

  factory CategoryInfra.fromJson(Map<String, dynamic> json) =>
      _$CategoryInfraFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryInfraToJson(this);
}
