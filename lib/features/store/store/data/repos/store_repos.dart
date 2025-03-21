import 'package:pets_care_app/core/helper/shared_prefs/shared_prefs.dart';
import 'package:pets_care_app/core/helper/shared_prefs/shared_prefs_constant.dart';
import 'package:pets_care_app/core/network/api_error_handler.dart';
import 'package:pets_care_app/core/network/api_result.dart';
import 'package:pets_care_app/core/network/api_service.dart';
import 'package:pets_care_app/features/store/client/data/models/product_model.dart';
import 'package:pets_care_app/features/store/store/data/models/store_info_response.dart';

class StoreStoreRepos {
  final ApiService _apiService;

  StoreStoreRepos(this._apiService);
  Future<ApiResult<StoreInfoResponse>> getStoreProfile() async {
    try {
      final response = await _apiService.getStoreProfile(
          'Bearer ${await SharedPrefHelper.getSecuredData(SharedPrefsConstant.token)}');
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<dynamic>> updateStoreProfile(
      Map<String, dynamic> body) async {
    try {
      final response = await _apiService.updateProfile(
          'Bearer ${await SharedPrefHelper.getSecuredData(SharedPrefsConstant.token)}',
          body);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<dynamic>> addProduct(Map<String, dynamic> body) async {
    try {
      final response = await _apiService.addProduct(
          'Bearer ${await SharedPrefHelper.getSecuredData(SharedPrefsConstant.token)}',
          body);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<List<ProductResponse>>> getAllProducts() async {
    try {
      final response = await _apiService.getAllProducts(
          'Bearer 130|AtF3ZyBqdSTCJcWjcZVlaADDZf5vUNMhE6qGS7ji53a73628');
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
