// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationResponse _$LocationResponseFromJson(Map<String, dynamic> json) =>
    LocationResponse(
      message: json['message'] as String,
      userId: (json['user_id'] as num).toInt(),
      petId: (json['pet_id'] as num).toInt(),
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$LocationResponseToJson(LocationResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'user_id': instance.userId,
      'pet_id': instance.petId,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
