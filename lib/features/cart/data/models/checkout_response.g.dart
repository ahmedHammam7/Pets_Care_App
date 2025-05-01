// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckoutResponse _$CheckoutResponseFromJson(Map<String, dynamic> json) =>
    CheckoutResponse(
      message: json['message'] as String,
      orderDetails: CheckoutOrderDetails.fromJson(
          json['order_details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CheckoutResponseToJson(CheckoutResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'order_details': instance.orderDetails,
    };

CheckoutOrderDetails _$CheckoutOrderDetailsFromJson(
        Map<String, dynamic> json) =>
    CheckoutOrderDetails(
      id: (json['order_id'] as num).toInt(),
      status: json['status'] as String,
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$CheckoutOrderDetailsToJson(
        CheckoutOrderDetails instance) =>
    <String, dynamic>{
      'order_id': instance.id,
      'status': instance.status,
      'total': instance.total,
    };
