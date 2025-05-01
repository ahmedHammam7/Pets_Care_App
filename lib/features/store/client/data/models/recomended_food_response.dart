import 'package:json_annotation/json_annotation.dart';
part 'recomended_food_response.g.dart';

@JsonSerializable()
class RecomendedFoodResponse {
  @JsonKey(name: 'recommended_food')
  final List<RecomendedFoodItems> items;

  RecomendedFoodResponse({required this.items});

  factory RecomendedFoodResponse.fromJson(Map<String, dynamic> json) =>
      _$RecomendedFoodResponseFromJson(json);
}

@JsonSerializable()
class RecomendedFoodItems {
  final int id;
  final String name;
  @JsonKey(name: 'image_url')
  final String? image;
  final String? description;
  final String category;
  @JsonKey(name: 'food_type')
  final String foodType;
  final String price;

  RecomendedFoodItems(
      {required this.id,
      required this.name,
      required this.image,
      required this.description,
      required this.category,
      required this.foodType,
      required this.price});
  factory RecomendedFoodItems.fromJson(Map<String, dynamic> json) =>
      _$RecomendedFoodItemsFromJson(json);
}
