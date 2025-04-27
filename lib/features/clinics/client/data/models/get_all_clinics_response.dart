import 'package:json_annotation/json_annotation.dart';
part 'get_all_clinics_response.g.dart';

@JsonSerializable()
class GetAllClinicsResponse {
  final List<ClinicResponseData> clinics;

  GetAllClinicsResponse({required this.clinics});

  factory GetAllClinicsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllClinicsResponseFromJson(json);
}

@JsonSerializable()
class ClinicResponseData {
  @JsonKey(name: "appointment_date")
  final String? appointmentDate;
  final String? day;
  final String? time;
  @JsonKey(name: "time_range")
  final String? timeRange;
  final String? price;
  final String? address;
  @JsonKey(name: "photo_url")
  final String? photo;
  final int? id;
  @JsonKey(name: "doctor_name")
  final String? doctorName;

  ClinicResponseData(
      {required this.appointmentDate,
      required this.day,
      required this.time,
      required this.timeRange,
      required this.price,
      required this.address,
      required this.photo,
      required this.id,
      required this.doctorName});

  factory ClinicResponseData.fromJson(Map<String, dynamic> json) =>
      _$ClinicResponseDataFromJson(json);
}
