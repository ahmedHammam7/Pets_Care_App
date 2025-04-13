// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClinicRequest _$ClinicRequestFromJson(Map<String, dynamic> json) =>
    ClinicRequest(
      appointmentDate: json['appointment_date'] as String,
      day: json['day'] as String,
      time: json['time'] as String,
      price: json['price'] as String,
      address: json['address'] as String,
      doctorID: json['doctor_id'] as String,
    );

Map<String, dynamic> _$ClinicRequestToJson(ClinicRequest instance) =>
    <String, dynamic>{
      'appointment_date': instance.appointmentDate,
      'day': instance.day,
      'time': instance.time,
      'price': instance.price,
      'address': instance.address,
      'doctor_id': instance.doctorID,
    };
