import 'package:json_annotation/json_annotation.dart';

part 'activity_response.g.dart';

@JsonSerializable()
class ActivityResponse {
  final String message;
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'pet_id')
  final int petId;
  final String activity;
  final dynamic temperature;

  ActivityResponse({
    required this.message,
    required this.userId,
    required this.petId,
    required this.activity,
    required this.temperature,
  });

  factory ActivityResponse.fromJson(Map<String, dynamic> json) =>
      _$ActivityResponseFromJson(json);
}
