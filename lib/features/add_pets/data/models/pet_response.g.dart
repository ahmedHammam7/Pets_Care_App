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
      vaccineTime: json['vaccination_time'] as String?,
      photo: json['photo_url'] as String,
    );
