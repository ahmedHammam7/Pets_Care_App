// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavouriteResponse _$FavouriteResponseFromJson(Map<String, dynamic> json) =>
    FavouriteResponse(
      itemId: (json['item_id'] as num).toInt(),
      item:
          FavouriteResponseItem.fromJson(json['item'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FavouriteResponseToJson(FavouriteResponse instance) =>
    <String, dynamic>{
      'item_id': instance.itemId,
      'item': instance.item,
    };

FavouriteResponseItem _$FavouriteResponseItemFromJson(
        Map<String, dynamic> json) =>
    FavouriteResponseItem(
      name: json['name'] as String?,
      category: json['category'] as String?,
      foodType: json['food_type'] as String?,
      price: json['price'] as String?,
      description: json['description'] as String?,
      image: json['image_url'] as String?,
    );

Map<String, dynamic> _$FavouriteResponseItemToJson(
        FavouriteResponseItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'category': instance.category,
      'food_type': instance.foodType,
      'price': instance.price,
      'description': instance.description,
      'image_url': instance.image,
    };
