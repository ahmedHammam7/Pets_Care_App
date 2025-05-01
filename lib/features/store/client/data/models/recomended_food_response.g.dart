// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recomended_food_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecomendedFoodResponse _$RecomendedFoodResponseFromJson(
        Map<String, dynamic> json) =>
    RecomendedFoodResponse(
      items: (json['recommended_food'] as List<dynamic>)
          .map((e) => RecomendedFoodItems.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecomendedFoodResponseToJson(
        RecomendedFoodResponse instance) =>
    <String, dynamic>{
      'recommended_food': instance.items,
    };

RecomendedFoodItems _$RecomendedFoodItemsFromJson(Map<String, dynamic> json) =>
    RecomendedFoodItems(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      image: json['image_url'] as String?,
      description: json['description'] as String?,
      category: json['category'] as String,
      foodType: json['food_type'] as String,
      price: json['price'] as String,
    );

Map<String, dynamic> _$RecomendedFoodItemsToJson(
        RecomendedFoodItems instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image_url': instance.image,
      'description': instance.description,
      'category': instance.category,
      'food_type': instance.foodType,
      'price': instance.price,
    };
