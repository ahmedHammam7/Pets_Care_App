import 'package:json_annotation/json_annotation.dart';
part 'checkout_response.g.dart';

@JsonSerializable()
class CheckoutResponse {
  final String message;
  @JsonKey(name: 'order_details')
  final CheckoutOrderDetails orderDetails;

  CheckoutResponse({required this.message, required this.orderDetails});

  factory CheckoutResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckoutResponseFromJson(json);
}

@JsonSerializable()
class CheckoutOrderDetails {
  @JsonKey(name: 'order_id')
  final int id;
  final String status;
  final int total;

  CheckoutOrderDetails(
      {required this.id, required this.status, required this.total});
  factory CheckoutOrderDetails.fromJson(Map<String, dynamic> json) =>
      _$CheckoutOrderDetailsFromJson(json);
}
