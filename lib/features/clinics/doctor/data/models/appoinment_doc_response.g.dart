// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appoinment_doc_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppoinmentDocResponse _$AppoinmentDocResponseFromJson(
        Map<String, dynamic> json) =>
    AppoinmentDocResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => AppoinmentDocData.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$AppoinmentDocResponseToJson(
        AppoinmentDocResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

AppoinmentDocData _$AppoinmentDocDataFromJson(Map<String, dynamic> json) =>
    AppoinmentDocData(
      pet: PetAppointmentDocResponse.fromJson(
          json['pet'] as Map<String, dynamic>),
      day: json['day'] as String,
      time: json['time'] as String,
      clinic: ClinicAppoinmentDocResponse.fromJson(
          json['veterinary_clinic'] as Map<String, dynamic>),
      user: UserAppointmentDocResponse.fromJson(
          json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppoinmentDocDataToJson(AppoinmentDocData instance) =>
    <String, dynamic>{
      'day': instance.day,
      'time': instance.time,
      'user': instance.user,
      'pet': instance.pet,
      'veterinary_clinic': instance.clinic,
    };

UserAppointmentDocResponse _$UserAppointmentDocResponseFromJson(
        Map<String, dynamic> json) =>
    UserAppointmentDocResponse(
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$UserAppointmentDocResponseToJson(
        UserAppointmentDocResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
    };

PetAppointmentDocResponse _$PetAppointmentDocResponseFromJson(
        Map<String, dynamic> json) =>
    PetAppointmentDocResponse(
      petName: json['pet_name'] as String,
      petType: json['pet_type'] as String,
      gender: json['gender'] as String,
      age: (json['age'] as num).toInt(),
      color: json['color'] as String,
      height: json['height'] as String,
      weight: json['weight'] as String,
      photo: json['photo_url'] as String,
    );

Map<String, dynamic> _$PetAppointmentDocResponseToJson(
        PetAppointmentDocResponse instance) =>
    <String, dynamic>{
      'pet_name': instance.petName,
      'pet_type': instance.petType,
      'gender': instance.gender,
      'age': instance.age,
      'color': instance.color,
      'height': instance.height,
      'weight': instance.weight,
      'photo_url': instance.photo,
    };

ClinicAppoinmentDocResponse _$ClinicAppoinmentDocResponseFromJson(
        Map<String, dynamic> json) =>
    ClinicAppoinmentDocResponse(
      appointmentDate: json['appointment_date'] as String,
      price: json['price'] as String,
      address: json['address'] as String,
      photo: json['photo_url'] as String,
    );

Map<String, dynamic> _$ClinicAppoinmentDocResponseToJson(
        ClinicAppoinmentDocResponse instance) =>
    <String, dynamic>{
      'appointment_date': instance.appointmentDate,
      'price': instance.price,
      'address': instance.address,
      'photo_url': instance.photo,
    };
