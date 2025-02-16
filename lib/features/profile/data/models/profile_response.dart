import 'package:json_annotation/json_annotation.dart';
part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponse {
  @JsonKey(name: "user")
  final ProfileUser user;

  ProfileResponse(this.user);

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);
}

@JsonSerializable()
class ProfileUser {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String type;

  ProfileUser(this.id, this.name, this.email, this.phone, this.type);

  factory ProfileUser.fromJson(Map<String, dynamic> json) =>
      _$ProfileUserFromJson(json);
}
