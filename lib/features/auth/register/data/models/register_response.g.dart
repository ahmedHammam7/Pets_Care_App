// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) =>
    RegisterResponse(
      (json['status_code'] as num?)?.toInt(),
      RegisterResponseResult.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterResponseToJson(RegisterResponse instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'result': instance.result,
    };

RegisterResponseResult _$RegisterResponseResultFromJson(
        Map<String, dynamic> json) =>
    RegisterResponseResult(
      json['message'] as String,
      RegisterResponseUserData.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterResponseResultToJson(
        RegisterResponseResult instance) =>
    <String, dynamic>{
      'message': instance.message,
      'user': instance.user,
    };

RegisterResponseUserData _$RegisterResponseUserDataFromJson(
        Map<String, dynamic> json) =>
    RegisterResponseUserData(
      json['email'] as String,
      json['name'] as String,
      json['phone'] as String,
      json['type'] as String,
    );

Map<String, dynamic> _$RegisterResponseUserDataToJson(
        RegisterResponseUserData instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'phone': instance.phone,
      'type': instance.type,
    };
