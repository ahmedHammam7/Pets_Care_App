// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'predict_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PredictResponse _$PredictResponseFromJson(Map<String, dynamic> json) =>
    PredictResponse(
      predictedDisease: json['predicted_disease'] as String,
      confidence: (json['confidence'] as num).toDouble(),
      recommendation: json['recommendation'] as String,
      image: json['image_url'] as String,
    );

Map<String, dynamic> _$PredictResponseToJson(PredictResponse instance) =>
    <String, dynamic>{
      'predicted_disease': instance.predictedDisease,
      'confidence': instance.confidence,
      'recommendation': instance.recommendation,
      'image_url': instance.image,
    };
