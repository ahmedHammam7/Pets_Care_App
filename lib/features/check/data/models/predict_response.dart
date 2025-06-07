import 'package:json_annotation/json_annotation.dart';
part 'predict_response.g.dart';
@JsonSerializable()
class PredictResponse {
  @JsonKey(name: 'predicted_disease')
  final String predictedDisease;
  final double confidence;
  final String recommendation;
  @JsonKey(name: 'image_url')
  final String image;

  PredictResponse(
      {required this.predictedDisease,
      required this.confidence,
      required this.recommendation,
      required this.image});

  factory PredictResponse.fromJson(Map<String, dynamic> json) =>
      _$PredictResponseFromJson(json);
}
