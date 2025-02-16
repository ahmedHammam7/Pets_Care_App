import 'package:json_annotation/json_annotation.dart';
part 'doctor_profile_response.g.dart';

@JsonSerializable()
class DoctorProfileResponse {
  @JsonKey(name: 'user')
  final DoctorProfileUsesr user;

  DoctorProfileResponse(this.user);

  factory DoctorProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$DoctorProfileResponseFromJson(json);
}

@JsonSerializable()
class DoctorProfileUsesr {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String type;
  @JsonKey(name: 'doctor')
 final DoctorProfileDoctor doctor;

  DoctorProfileUsesr(this.id, this.name, this.email, this.phone, this.type, this.doctor);

  factory DoctorProfileUsesr.fromJson(Map<String, dynamic> json) =>
      _$DoctorProfileUsesrFromJson(json);
}

@JsonSerializable()
class DoctorProfileDoctor {
  final String specialization;
  @JsonKey(name: 'license_number')
  final String licenseNumber;
  @JsonKey(name: 'experience_years')
  final String experienceYears;
  @JsonKey(name: 'working_time')
  final String workingTime;
  final String address;
  final String price;
  @JsonKey(name: 'medical_syndicate_code')
  final String medicalSyndicateCode;

  DoctorProfileDoctor(this.specialization, this.licenseNumber, this.experienceYears, this.workingTime, this.address, this.price, this.medicalSyndicateCode);

  factory DoctorProfileDoctor.fromJson(Map<String, dynamic> json) =>
      _$DoctorProfileDoctorFromJson(json);


}
