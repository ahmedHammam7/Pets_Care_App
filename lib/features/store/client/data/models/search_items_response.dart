import 'package:json_annotation/json_annotation.dart';
part 'search_items_response.g.dart';

@JsonSerializable()
class SearchItemsResponse {
  final List<SearchItemsData> items;

  SearchItemsResponse({required this.items});

  factory SearchItemsResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchItemsResponseFromJson(json);
}

@JsonSerializable()
class SearchItemsData {
  final int id;
  final String? name;
  @JsonKey(name: 'food_type')
  final String? foodType;
  final String? price;
  final String? description;
  @JsonKey(name: 'image_url')
  final String? image;
  final String? category;

  SearchItemsData(
      {required this.id,
      required this.name,
      required this.foodType,
      required this.price,
      required this.description,
      required this.image,
      required this.category});

  factory SearchItemsData.fromJson(Map<String, dynamic> json) =>
      _$SearchItemsDataFromJson(json);
}
