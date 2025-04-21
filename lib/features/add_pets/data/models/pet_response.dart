import 'package:json_annotation/json_annotation.dart';
part 'pet_response.g.dart';

@JsonSerializable()
class PetResponse {
  @JsonKey(name: 'id')
  final int petId;
  @JsonKey(name: 'pet_name')
  final String petName;
  @JsonKey(name: 'pet_type')
  final String petType;
  final String gender;
  final int age;
  final String color;
  final String height;
  final String weight;
  @JsonKey(name: 'vaccination_time')
  final String? vaccineTime;
  @JsonKey(name: 'photo_url')
  final String photo;

  PetResponse(
      {required this.petId,
      required this.petName,
      required this.petType,
      required this.gender,
      required this.age,
      required this.color,
      required this.height,
      required this.weight,
      required this.vaccineTime,
      required this.photo});

  factory PetResponse.fromJson(Map<String, dynamic> json) =>
      _$PetResponseFromJson(json);
}
