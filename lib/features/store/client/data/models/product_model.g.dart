// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    ProductResponse(
      name: json['name'] as String,
      foodType: json['food_type'] as String,
      price: json['price'] as String,
      description: json['description'] as String,
      id: (json['id'] as num).toInt(),
      image: json['image_url'] as String,
    );

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'food_type': instance.foodType,
      'price': instance.price,
      'description': instance.description,
      'image_url': instance.image,
    };
