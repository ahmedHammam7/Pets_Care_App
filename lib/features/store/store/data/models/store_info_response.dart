import 'package:json_annotation/json_annotation.dart';
part 'store_info_response.g.dart';

@JsonSerializable()
class StoreInfoResponse {
  @JsonKey(name: 'user')
  final StoreProfileUser user;

  StoreInfoResponse(this.user);

  factory StoreInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$StoreInfoResponseFromJson(json);
}

@JsonSerializable()
class StoreProfileUser {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String type;
  @JsonKey(name: 'store')
  final StoreProfileStore store;

  StoreProfileUser(
      this.id, this.name, this.email, this.phone, this.type, this.store);

  factory StoreProfileUser.fromJson(Map<String, dynamic> json) =>
      _$StoreProfileUserFromJson(json);
}

@JsonSerializable()
class StoreProfileStore {
  @JsonKey(name: 'store_name')
  final String storeName;
  final String address;
  @JsonKey(name: 'hot_line')
  final int hotLine;
  @JsonKey(name: 'whatsapp_phone')
  final String whatsappPhone;

  StoreProfileStore(
      this.storeName, this.address, this.hotLine, this.whatsappPhone);

  factory StoreProfileStore.fromJson(Map<String, dynamic> json) =>
      _$StoreProfileStoreFromJson(json);
}
