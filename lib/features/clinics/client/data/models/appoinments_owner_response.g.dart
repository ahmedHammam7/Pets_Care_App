// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appoinments_owner_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppoinmentsOwnerResponse _$AppoinmentsOwnerResponseFromJson(
        Map<String, dynamic> json) =>
    AppoinmentsOwnerResponse(
      doctor: AppoinmentDoctor.fromJson(json['doctor'] as Map<String, dynamic>),
      id: (json['id'] as num).toInt(),
      day: json['day'] as String,
      time: json['time'] as String,
      pet: AppoinmentPet.fromJson(json['pet'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppoinmentsOwnerResponseToJson(
        AppoinmentsOwnerResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'day': instance.day,
      'time': instance.time,
      'pet': instance.pet,
      'doctor': instance.doctor,
    };

AppoinmentPet _$AppoinmentPetFromJson(Map<String, dynamic> json) =>
    AppoinmentPet(
      name: json['pet_name'] as String,
      photo: json['photo_url'] as String,
    );

Map<String, dynamic> _$AppoinmentPetToJson(AppoinmentPet instance) =>
    <String, dynamic>{
      'pet_name': instance.name,
      'photo_url': instance.photo,
    };

AppoinmentDoctor _$AppoinmentDoctorFromJson(Map<String, dynamic> json) =>
    AppoinmentDoctor(
      price: (json['price'] as num).toInt(),
    );

Map<String, dynamic> _$AppoinmentDoctorToJson(AppoinmentDoctor instance) =>
    <String, dynamic>{
      'price': instance.price,
    };
