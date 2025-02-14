import 'package:json_annotation/json_annotation.dart';
part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse {
  @JsonKey(name: 'status_code')
  final int? statusCode;
  @JsonKey(name: 'result')
  RegisterResponseResult result;

  RegisterResponse(this.statusCode, this.result);

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);
}

@JsonSerializable()
class RegisterResponseResult {
  final String message;
  @JsonKey(name: 'user')
  RegisterResponseUserData user;

  RegisterResponseResult(this.message, this.user);

  factory RegisterResponseResult.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseResultFromJson(json);
}

@JsonSerializable()
class RegisterResponseUserData {
  final String email;
  final String name;
  final String phone;
  final String type;

  RegisterResponseUserData(this.email, this.name, this.phone, this.type);

  factory RegisterResponseUserData.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseUserDataFromJson(json);
}
