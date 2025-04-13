import 'package:json_annotation/json_annotation.dart';
part 'appoinment_doc_response.g.dart';

@JsonSerializable()
class AppoinmentDocResponse {
  final String day;
  final String time;
  final UserAppointmentDocResponse user;
  final PetAppointmentDocResponse pet;
  @JsonKey(name: 'veterinary_clinic')
  final ClinicAppoinmentDocResponse clinic;

  AppoinmentDocResponse(
      {required this.pet,
      required this.day,
      required this.time,
      required this.clinic,
      required this.user});

  factory AppoinmentDocResponse.fromJson(Map<String, dynamic> json) =>
      _$AppoinmentDocResponseFromJson(json);
}

@JsonSerializable()
class UserAppointmentDocResponse {
  final String name;
  final String email;
  final String phone;

  UserAppointmentDocResponse(
      {required this.name, required this.email, required this.phone});

  factory UserAppointmentDocResponse.fromJson(Map<String, dynamic> json) =>
      _$UserAppointmentDocResponseFromJson(json);
}

@JsonSerializable()
class PetAppointmentDocResponse {
  @JsonKey(name: 'pet_name')
  final String petName;
  @JsonKey(name: 'pet_type')
  final String petType;
  final String gender;
  final int age;
  final String color;
  final String height;
  final String weight;
  final String photo;

  PetAppointmentDocResponse(
      {required this.petName,
      required this.petType,
      required this.gender,
      required this.age,
      required this.color,
      required this.height,
      required this.weight,
      required this.photo});

  factory PetAppointmentDocResponse.fromJson(Map<String, dynamic> json) =>
      _$PetAppointmentDocResponseFromJson(json);
}
@JsonSerializable()
class ClinicAppoinmentDocResponse {
    @JsonKey(name: 'appointment_date')
    final String appointmentDate;
    final String price;
    final String address;
    final String photo;

  ClinicAppoinmentDocResponse({required this.appointmentDate, required this.price, required this.address, required this.photo});

  factory ClinicAppoinmentDocResponse.fromJson(Map<String, dynamic> json) =>
      _$ClinicAppoinmentDocResponseFromJson(json);
}
