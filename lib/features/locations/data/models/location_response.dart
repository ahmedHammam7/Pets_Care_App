import 'package:json_annotation/json_annotation.dart';
part 'location_response.g.dart';

@JsonSerializable()
class LocationResponse {
  final String message;
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'pet_id')
  final int petId;
  final double latitude;
  final double longitude;

  LocationResponse({
    required this.message,
    required this.userId,
    required this.petId,
    required this.latitude,
    required this.longitude,
  });

  factory LocationResponse.fromJson(Map<String, dynamic> json) =>
      _$LocationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LocationResponseToJson(this);
}
