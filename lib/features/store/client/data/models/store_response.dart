import 'package:json_annotation/json_annotation.dart';
part 'store_response.g.dart';

@JsonSerializable()
class StoreResponse {
  final List<StoreInfo> stores;

  StoreResponse({required this.stores});

  factory StoreResponse.fromJson(Map<String, dynamic> json) => _$StoreResponseFromJson(json);

}

@JsonSerializable()
class StoreInfo {
  final int id;
   @JsonKey(name: 'store_name')
  final String storeName;
  final String address;
  @JsonKey(name: 'hot_line')
  final int hotLine;
  @JsonKey(name: 'whatsapp_phone')
  final String whatsappPhone;

  StoreInfo({required this.id, required this.storeName, required this.address, required this.hotLine, required this.whatsappPhone});

  factory StoreInfo.fromJson(Map<String, dynamic> json) => _$StoreInfoFromJson(json);

}
