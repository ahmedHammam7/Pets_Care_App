// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_cart_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCartResponse _$GetCartResponseFromJson(Map<String, dynamic> json) =>
    GetCartResponse(
      items: (json['cart_items'] as List<dynamic>)
          .map((e) => GetCartItems.fromJson(e as Map<String, dynamic>))
          .toList(),
      overall: GetCartItemsOverallPrice.fromJson(
          json['overall'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetCartResponseToJson(GetCartResponse instance) =>
    <String, dynamic>{
      'cart_items': instance.items,
      'overall': instance.overall,
    };

GetCartItems _$GetCartItemsFromJson(Map<String, dynamic> json) => GetCartItems(
      id: (json['id'] as num).toInt(),
      userID: (json['user_id'] as num).toInt(),
      itemID: (json['item_id'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      item: GetCartItem.fromJson(json['item'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetCartItemsToJson(GetCartItems instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userID,
      'item_id': instance.itemID,
      'quantity': instance.quantity,
      'item': instance.item,
    };

GetCartItem _$GetCartItemFromJson(Map<String, dynamic> json) => GetCartItem(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      category: json['category'] as String?,
      foodType: json['food_type'] as String,
      price: json['price'] as String,
      image: json['image_url'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$GetCartItemToJson(GetCartItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'food_type': instance.foodType,
      'price': instance.price,
      'image_url': instance.image,
      'description': instance.description,
    };

GetCartItemsOverallPrice _$GetCartItemsOverallPriceFromJson(
        Map<String, dynamic> json) =>
    GetCartItemsOverallPrice(
      overallPrice: (json['overall_price'] as num).toInt(),
    );

Map<String, dynamic> _$GetCartItemsOverallPriceToJson(
        GetCartItemsOverallPrice instance) =>
    <String, dynamic>{
      'overall_price': instance.overallPrice,
    };
