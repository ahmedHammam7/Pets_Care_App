// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PetResponse _$PetResponseFromJson(Map<String, dynamic> json) => PetResponse(
      petId: (json['id'] as num).toInt(),
      petName: json['pet_name'] as String,
      petType: json['pet_type'] as String,
      gender: json['gender'] as String,
      age: (json['age'] as num).toInt(),
      color: json['color'] as String,
      height: json['height'] as String,
      weight: json['weight'] as String,
      vaccineTime: json['vaccination_time'] as String,
      photo: json['photo_url'] as String,
    );

Map<String, dynamic> _$PetResponseToJson(PetResponse instance) =>
    <String, dynamic>{
      'id': instance.petId,
      'pet_name': instance.petName,
      'pet_type': instance.petType,
      'gender': instance.gender,
      'age': instance.age,
      'color': instance.color,
      'height': instance.height,
      'weight': instance.weight,
      'vaccination_time': instance.vaccineTime,
      'photo_url': instance.photo,
    };
