import 'package:json_annotation/json_annotation.dart';
part 'product_model.g.dart';

@JsonSerializable()
class ProductResponse {
  final int id;
  final String name;
  @JsonKey(name: 'food_type')
  final String foodType;
  final String price;
  final String description;
  @JsonKey(name: 'image_url')
  final String image;

  ProductResponse(
      {required this.name,
      required this.foodType,
      required this.price,
      required this.description,
      required this.id,
      required this.image});

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);
}
