// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreResponse _$StoreResponseFromJson(Map<String, dynamic> json) =>
    StoreResponse(
      stores: (json['stores'] as List<dynamic>)
          .map((e) => StoreInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StoreResponseToJson(StoreResponse instance) =>
    <String, dynamic>{
      'stores': instance.stores,
    };

StoreInfo _$StoreInfoFromJson(Map<String, dynamic> json) => StoreInfo(
      id: (json['id'] as num).toInt(),
      storeName: json['store_name'] as String,
      address: json['address'] as String,
      hotLine: (json['hot_line'] as num).toInt(),
      whatsappPhone: json['whatsapp_phone'] as String,
    );

Map<String, dynamic> _$StoreInfoToJson(StoreInfo instance) => <String, dynamic>{
      'id': instance.id,
      'store_name': instance.storeName,
      'address': instance.address,
      'hot_line': instance.hotLine,
      'whatsapp_phone': instance.whatsappPhone,
    };
