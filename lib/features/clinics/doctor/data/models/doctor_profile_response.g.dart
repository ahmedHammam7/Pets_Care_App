// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorProfileResponse _$DoctorProfileResponseFromJson(
        Map<String, dynamic> json) =>
    DoctorProfileResponse(
      DoctorProfileUsesr.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DoctorProfileResponseToJson(
        DoctorProfileResponse instance) =>
    <String, dynamic>{
      'user': instance.user,
    };

DoctorProfileUsesr _$DoctorProfileUsesrFromJson(Map<String, dynamic> json) =>
    DoctorProfileUsesr(
      (json['id'] as num).toInt(),
      json['name'] as String,
      json['email'] as String,
      json['phone'] as String,
      json['type'] as String,
      DoctorProfileDoctor.fromJson(json['doctor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DoctorProfileUsesrToJson(DoctorProfileUsesr instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'type': instance.type,
      'doctor': instance.doctor,
    };

DoctorProfileDoctor _$DoctorProfileDoctorFromJson(Map<String, dynamic> json) =>
    DoctorProfileDoctor(
      json['specialization'] as String,
      json['license_number'] as String,
      (json['experience_years'] as num).toInt(),
      json['working_time'] as String,
      json['address'] as String,
      (json['price'] as num).toInt(),
      (json['medical_syndicate_code'] as num).toInt(),
    );

Map<String, dynamic> _$DoctorProfileDoctorToJson(
        DoctorProfileDoctor instance) =>
    <String, dynamic>{
      'specialization': instance.specialization,
      'license_number': instance.licenseNumber,
      'experience_years': instance.experienceYears,
      'working_time': instance.workingTime,
      'address': instance.address,
      'price': instance.price,
      'medical_syndicate_code': instance.medicalSyndicateCode,
    };
