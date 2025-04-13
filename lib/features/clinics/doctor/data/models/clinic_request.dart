import 'package:json_annotation/json_annotation.dart';
part 'clinic_request.g.dart';

@JsonSerializable()
class ClinicRequest {
  @JsonKey(name: "appointment_date")
  final String appointmentDate;
  final String day;
  final String time;
  final String price;
  final String address;
  @JsonKey(name: "doctor_id")
  final String doctorID;

  ClinicRequest({
    required this.appointmentDate,
    required this.day,
    required this.time,
    required this.price,
    required this.address,
    required this.doctorID,
  });
  Map<String, dynamic> toJson() => _$ClinicRequestToJson(this);
}
