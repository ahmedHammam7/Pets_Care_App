import 'package:json_annotation/json_annotation.dart';
part 'appoinments_owner_response.g.dart';

@JsonSerializable()
class AppoinmentsOwnerResponse {
  final int id;
  final String day;
  final String time;
  final AppoinmentPet pet;
  final AppoinmentDoctor doctor;

  AppoinmentsOwnerResponse(
      {required this.doctor,
      required this.id,
      required this.day,
      required this.time,
      required this.pet});

  factory AppoinmentsOwnerResponse.fromJson(Map<String, dynamic> json) =>
      _$AppoinmentsOwnerResponseFromJson(json);
}

@JsonSerializable()
class AppoinmentPet {
  @JsonKey(name: 'pet_name')
  final String name;
  @JsonKey(name: 'photo_url')
  final String photo;

  AppoinmentPet({required this.name, required this.photo});
  factory AppoinmentPet.fromJson(Map<String, dynamic> json) =>
      _$AppoinmentPetFromJson(json);
}

@JsonSerializable()
class AppoinmentDoctor {
  final int price;

  AppoinmentDoctor({
    required this.price,
  });
  factory AppoinmentDoctor.fromJson(Map<String, dynamic> json) =>
      _$AppoinmentDoctorFromJson(json);
}
