// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductBody _$ProductBodyFromJson(Map<String, dynamic> json) => ProductBody(
      name: json['name'] as String,
      description: json['description'] as String,
      price: json['price'] as String,
      foodType: json['food_type'] as String,
      category: json['category'] as String,
    );

Map<String, dynamic> _$ProductBodyToJson(ProductBody instance) =>
    <String, dynamic>{
      'name': instance.name,
      'food_type': instance.foodType,
      'price': instance.price,
      'description': instance.description,
      'category': instance.category,
    };
