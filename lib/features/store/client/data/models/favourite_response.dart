import 'package:json_annotation/json_annotation.dart';
part 'favourite_response.g.dart';

@JsonSerializable()
class FavouriteResponse {
  @JsonKey(name: 'item_id')
  final int itemId;
  final FavouriteResponseItem item;

  FavouriteResponse({required this.itemId, required this.item});

  factory FavouriteResponse.fromJson(Map<String, dynamic> json) =>
      _$FavouriteResponseFromJson(json);
}

@JsonSerializable()
class FavouriteResponseItem {
  final String? name;
  final String? category;
  @JsonKey(name: 'food_type')
  final String? foodType;
  final String? price;
  final String? description;
  @JsonKey(name: 'image_url')
  final String? image;

  FavouriteResponseItem(
      {required this.name,
      required this.category,
      required this.foodType,
      required this.price,
      required this.description,
      required this.image});
  factory FavouriteResponseItem.fromJson(Map<String, dynamic> json) =>
      _$FavouriteResponseItemFromJson(json);
}
