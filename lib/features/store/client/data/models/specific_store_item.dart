import 'package:json_annotation/json_annotation.dart';
part 'specific_store_item.g.dart';

@JsonSerializable()
class SpecificStoreResponse {
  final SpecificStoreInfo store;

  SpecificStoreResponse({required this.store});

  factory SpecificStoreResponse.fromJson(Map<String, dynamic> json) =>
      _$SpecificStoreResponseFromJson(json);
}

@JsonSerializable()
class SpecificStoreInfo {
  final int? id;
  @JsonKey(name: "store_name")
  final String? storeName;
  final String? address;
  @JsonKey(name: "hot_line")
  final int? hotLine;
  @JsonKey(name: "whatsapp_phone")
  final String? whatsappPhone;
  final List<SpecificStoreItems> items;

  SpecificStoreInfo(
      {required this.id,
      required this.storeName,
      required this.address,
      required this.hotLine,
      required this.whatsappPhone,
      required this.items});

  factory SpecificStoreInfo.fromJson(Map<String, dynamic> json) =>
      _$SpecificStoreInfoFromJson(json);
}

@JsonSerializable()
class SpecificStoreItems {
  final int? id;
  final String? name;
  final String? category;
  @JsonKey(name: "food_type")
  final String? foodType;
  final String? price;
  final String? description;
  @JsonKey(name: "image_url")
  final String? image;

  SpecificStoreItems(
      {required this.id,
      required this.name,
      required this.category,
      required this.foodType,
      required this.price,
      required this.description,
      required this.image});

  factory SpecificStoreItems.fromJson(Map<String, dynamic> json) =>
      _$SpecificStoreItemsFromJson(json);
}
