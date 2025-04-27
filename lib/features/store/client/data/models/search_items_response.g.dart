// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_items_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchItemsResponse _$SearchItemsResponseFromJson(Map<String, dynamic> json) =>
    SearchItemsResponse(
      items: (json['items'] as List<dynamic>)
          .map((e) => SearchItemsData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchItemsResponseToJson(
        SearchItemsResponse instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

SearchItemsData _$SearchItemsDataFromJson(Map<String, dynamic> json) =>
    SearchItemsData(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      foodType: json['food_type'] as String?,
      price: json['price'] as String?,
      description: json['description'] as String?,
      image: json['image_url'] as String?,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$SearchItemsDataToJson(SearchItemsData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'food_type': instance.foodType,
      'price': instance.price,
      'description': instance.description,
      'image_url': instance.image,
      'category': instance.category,
    };
