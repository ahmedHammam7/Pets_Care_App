// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityResponse _$ActivityResponseFromJson(Map<String, dynamic> json) =>
    ActivityResponse(
      message: json['message'] as String,
      userId: (json['user_id'] as num).toInt(),
      petId: (json['pet_id'] as num).toInt(),
      activity: json['activity'] as String,
      temperature: json['temperature'],
    );

Map<String, dynamic> _$ActivityResponseToJson(ActivityResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'user_id': instance.userId,
      'pet_id': instance.petId,
      'activity': instance.activity,
      'temperature': instance.temperature,
    };
