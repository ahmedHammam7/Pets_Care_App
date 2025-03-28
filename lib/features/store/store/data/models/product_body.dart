import 'package:json_annotation/json_annotation.dart';
part 'product_body.g.dart';

@JsonSerializable()
class ProductBody {
  final String name;
  @JsonKey(name: 'food_type')
  final String foodType;
  final String price;
  final String description;
  final String category;
  ProductBody(
      {required this.name,
      required this.description,
      required this.price,
      required this.foodType,
      required this.category});

  Map<String, dynamic> toJson() => _$ProductBodyToJson(this);
}
