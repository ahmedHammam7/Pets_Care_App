import 'package:pets_care_app/core/helper/shared_prefs/shared_prefs.dart';
import 'package:pets_care_app/core/helper/shared_prefs/shared_prefs_constant.dart';
import 'package:pets_care_app/core/network/api_error_handler.dart';
import 'package:pets_care_app/core/network/api_result.dart';
import 'package:pets_care_app/core/network/api_service.dart';
import 'package:pets_care_app/features/cart/data/models/checkout_response.dart';
import 'package:pets_care_app/features/cart/data/models/get_cart_response.dart';

class CartRepo {
  final ApiService apiService;
  CartRepo(this.apiService);

  Future<ApiResult<GetCartResponse>> getCart() async {
    try {
      final response = await apiService.getCart(
          'Bearer ${await SharedPrefHelper.getSecuredData(SharedPrefsConstant.token)}');
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<dynamic>> deleteCart(String id) async {
    try {
      final response = await apiService.deleteCart(
          'Bearer ${await SharedPrefHelper.getSecuredData(SharedPrefsConstant.token)}',
          id);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<CheckoutResponse>> checkout() async {
    try {
      final response = await apiService.checkout(
          'Bearer ${await SharedPrefHelper.getSecuredData(SharedPrefsConstant.token)}');
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
