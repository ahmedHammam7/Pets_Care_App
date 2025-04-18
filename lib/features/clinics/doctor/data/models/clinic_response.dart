import 'package:json_annotation/json_annotation.dart';
part 'clinic_response.g.dart';

@JsonSerializable()
class ClinicResponse {
  @JsonKey(name: "appointment_date")
  final String appointmentDate;
  final String day;
  final String time;
  @JsonKey(name: "end_time")
  final String endTime;
  final String price;
  final String address;
  @JsonKey(name: "photo_url")
  final String photo;
  final int id;

  ClinicResponse(
      {required this.appointmentDate,
      required this.day,
      required this.id,
      required this.endTime,
      required this.time,
      required this.price,
      required this.address,
      required this.photo});

  factory ClinicResponse.fromJson(Map<String, dynamic> json) =>
      _$ClinicResponseFromJson(json);
}
