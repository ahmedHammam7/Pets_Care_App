// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClinicResponse _$ClinicResponseFromJson(Map<String, dynamic> json) =>
    ClinicResponse(
      appointmentDate: json['appointment_date'] as String,
      day: json['day'] as String,
      id: (json['id'] as num).toInt(),
      endTime: json['end_time'] as String,
      time: json['time'] as String,
      price: json['price'] as String,
      address: json['address'] as String,
      photo: json['photo_url'] as String,
    );

Map<String, dynamic> _$ClinicResponseToJson(ClinicResponse instance) =>
    <String, dynamic>{
      'appointment_date': instance.appointmentDate,
      'day': instance.day,
      'time': instance.time,
      'end_time': instance.endTime,
      'price': instance.price,
      'address': instance.address,
      'photo_url': instance.photo,
      'id': instance.id,
    };
