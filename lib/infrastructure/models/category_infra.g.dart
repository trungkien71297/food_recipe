// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_infra.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesListInfra _$CategoriesListInfraFromJson(Map<String, dynamic> json) {
  return CategoriesListInfra(
    categories: (json['categories'] as List)
        ?.map((e) => e == null
            ? null
            : CategoryInfra.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CategoriesListInfraToJson(
        CategoriesListInfra instance) =>
    <String, dynamic>{
      'categories': instance.categories,
    };

CategoryInfra _$CategoryInfraFromJson(Map<String, dynamic> json) {
  return CategoryInfra(
    idCategory: json['idCategory'] as String,
    strCategory: json['strCategory'] as String,
    strCategoryThumb: json['strCategoryThumb'] as String,
    strCategoryDescription: json['strCategoryDescription'] as String,
  );
}

Map<String, dynamic> _$CategoryInfraToJson(CategoryInfra instance) =>
    <String, dynamic>{
      'idCategory': instance.idCategory,
      'strCategory': instance.strCategory,
      'strCategoryThumb': instance.strCategoryThumb,
      'strCategoryDescription': instance.strCategoryDescription,
    };
