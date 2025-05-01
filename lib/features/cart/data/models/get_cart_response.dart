import 'package:json_annotation/json_annotation.dart';

part 'get_cart_response.g.dart';

@JsonSerializable()
class GetCartResponse {
  @JsonKey(name: 'cart_items')
  final List<GetCartItems> items;
  @JsonKey(name: 'overall')
  final GetCartItemsOverallPrice overall;
  factory GetCartResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCartResponseFromJson(json);

  GetCartResponse({required this.items, required this.overall});
}

@JsonSerializable()
class GetCartItems {
  final int id;
  @JsonKey(name: 'user_id')
  final int userID;
  @JsonKey(name: 'item_id')
  final int itemID;
  final int quantity;
  final GetCartItem item;

  GetCartItems(
      {required this.id,
      required this.userID,
      required this.itemID,
      required this.quantity,
      required this.item});

  factory GetCartItems.fromJson(Map<String, dynamic> json) =>
      _$GetCartItemsFromJson(json);
}

@JsonSerializable()
class GetCartItem {
  final int id;
  final String name;
  final String? category;
  @JsonKey(name: 'food_type')
  final String foodType;
  final String price;
  @JsonKey(name: 'image_url')
  final String? image;
  final String? description;

  GetCartItem(
      {required this.id,
      required this.name,
      required this.category,
      required this.foodType,
      required this.price,
      required this.image,
      required this.description});
  factory GetCartItem.fromJson(Map<String, dynamic> json) =>
      _$GetCartItemFromJson(json);
}

@JsonSerializable()
class GetCartItemsOverallPrice {
  @JsonKey(name: 'overall_price')
  final int overallPrice;

  GetCartItemsOverallPrice({required this.overallPrice});

  factory GetCartItemsOverallPrice.fromJson(Map<String, dynamic> json) =>
      _$GetCartItemsOverallPriceFromJson(json);
}
