// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_clinics_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllClinicsResponse _$GetAllClinicsResponseFromJson(
        Map<String, dynamic> json) =>
    GetAllClinicsResponse(
      clinics: (json['clinics'] as List<dynamic>)
          .map((e) => ClinicResponseData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllClinicsResponseToJson(
        GetAllClinicsResponse instance) =>
    <String, dynamic>{
      'clinics': instance.clinics,
    };

ClinicResponseData _$ClinicResponseDataFromJson(Map<String, dynamic> json) =>
    ClinicResponseData(
      appointmentDate: json['appointment_date'] as String?,
      day: json['day'] as String?,
      time: json['time'] as String?,
      timeRange: json['time_range'] as String?,
      price: json['price'] as String?,
      address: json['address'] as String?,
      photo: json['photo_url'] as String?,
      id: (json['id'] as num?)?.toInt(),
      doctorName: json['doctor_name'] as String?,
    );

Map<String, dynamic> _$ClinicResponseDataToJson(ClinicResponseData instance) =>
    <String, dynamic>{
      'appointment_date': instance.appointmentDate,
      'day': instance.day,
      'time': instance.time,
      'time_range': instance.timeRange,
      'price': instance.price,
      'address': instance.address,
      'photo_url': instance.photo,
      'id': instance.id,
      'doctor_name': instance.doctorName,
    };
