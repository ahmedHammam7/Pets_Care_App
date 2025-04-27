// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specific_store_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecificStoreResponse _$SpecificStoreResponseFromJson(
        Map<String, dynamic> json) =>
    SpecificStoreResponse(
      store: SpecificStoreInfo.fromJson(json['store'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SpecificStoreResponseToJson(
        SpecificStoreResponse instance) =>
    <String, dynamic>{
      'store': instance.store,
    };

SpecificStoreInfo _$SpecificStoreInfoFromJson(Map<String, dynamic> json) =>
    SpecificStoreInfo(
      id: (json['id'] as num?)?.toInt(),
      storeName: json['store_name'] as String?,
      address: json['address'] as String?,
      hotLine: (json['hot_line'] as num?)?.toInt(),
      whatsappPhone: json['whatsapp_phone'] as String?,
      items: (json['items'] as List<dynamic>)
          .map((e) => SpecificStoreItems.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpecificStoreInfoToJson(SpecificStoreInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'store_name': instance.storeName,
      'address': instance.address,
      'hot_line': instance.hotLine,
      'whatsapp_phone': instance.whatsappPhone,
      'items': instance.items,
    };

SpecificStoreItems _$SpecificStoreItemsFromJson(Map<String, dynamic> json) =>
    SpecificStoreItems(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      category: json['category'] as String?,
      foodType: json['food_type'] as String?,
      price: json['price'] as String?,
      description: json['description'] as String?,
      image: json['image_url'] as String?,
    );

Map<String, dynamic> _$SpecificStoreItemsToJson(SpecificStoreItems instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'food_type': instance.foodType,
      'price': instance.price,
      'description': instance.description,
      'image_url': instance.image,
    };
