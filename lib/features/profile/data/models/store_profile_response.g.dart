// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreProfileResponse _$StoreProfileResponseFromJson(
        Map<String, dynamic> json) =>
    StoreProfileResponse(
      StoreProfileUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StoreProfileResponseToJson(
        StoreProfileResponse instance) =>
    <String, dynamic>{
      'user': instance.user,
    };

StoreProfileUser _$StoreProfileUserFromJson(Map<String, dynamic> json) =>
    StoreProfileUser(
      (json['id'] as num).toInt(),
      json['name'] as String,
      json['email'] as String,
      json['phone'] as String,
      json['type'] as String,
      StoreProfileStore.fromJson(json['store'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StoreProfileUserToJson(StoreProfileUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'type': instance.type,
      'store': instance.store,
    };

StoreProfileStore _$StoreProfileStoreFromJson(Map<String, dynamic> json) =>
    StoreProfileStore(
      json['store_name'] as String,
      json['address'] as String,
      (json['hot_line'] as num).toInt(),
      json['whatsapp_phone'] as String,
    );

Map<String, dynamic> _$StoreProfileStoreToJson(StoreProfileStore instance) =>
    <String, dynamic>{
      'store_name': instance.storeName,
      'address': instance.address,
      'hot_line': instance.hotLine,
      'whatsapp_phone': instance.whatsappPhone,
    };
