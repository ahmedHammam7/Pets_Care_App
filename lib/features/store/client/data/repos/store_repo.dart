import 'package:dio/dio.dart';
import 'package:pets_care_app/core/helper/shared_prefs/shared_prefs.dart';
import 'package:pets_care_app/core/helper/shared_prefs/shared_prefs_constant.dart';
import 'package:pets_care_app/core/network/api_error_handler.dart';
import 'package:pets_care_app/core/network/api_result.dart';
import 'package:pets_care_app/core/network/api_service.dart';
import 'package:pets_care_app/features/store/client/data/models/product_model.dart';
import 'package:pets_care_app/features/store/client/data/models/recomended_food_response.dart';
import 'package:pets_care_app/features/store/client/data/models/search_items_response.dart';
import 'package:pets_care_app/features/store/client/data/models/specific_store_item.dart';
import 'package:pets_care_app/features/store/client/data/models/store_response.dart';

class StoreRepo {
  final ApiService _apiService;

  StoreRepo(this._apiService);

  Future<ApiResult<List<ProductResponse>>> getAllProducts() async {
    try {
      final response = await _apiService.getAllProducts(
          'Bearer ${await SharedPrefHelper.getSecuredData(SharedPrefsConstant.token)}');
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<StoreResponse>> getAllStores() async {
    try {
      final response = await _apiService.getAllStores(
          'Bearer ${await SharedPrefHelper.getSecuredData(SharedPrefsConstant.token)}');
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<StoreResponse>> searchStore(String query) async {
    try {
      final response = await _apiService.searchStore(
          'Bearer ${await SharedPrefHelper.getSecuredData(SharedPrefsConstant.token)}',
          query);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<SpecificStoreResponse>> getSpecificStore(String id) async {
    try {
      final response = await _apiService.getSpecificStoreAndItems(
          'Bearer ${await SharedPrefHelper.getSecuredData(SharedPrefsConstant.token)}',
          '$id/items');
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<SearchItemsResponse>> searchItems(String query) async {
    try {
      final response = await _apiService.searchItems(
          'Bearer ${await SharedPrefHelper.getSecuredData(SharedPrefsConstant.token)}',
          query);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<dynamic>> addToCart(FormData body) async {
    try {
      final response = await _apiService.addToCart(
          'Bearer ${await SharedPrefHelper.getSecuredData(SharedPrefsConstant.token)}',
          body);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<RecomendedFoodResponse>> getRecommendedFood() async {
    try {
      final response = await _apiService.getRecommendedFood(
          'Bearer ${await SharedPrefHelper.getSecuredData(SharedPrefsConstant.token)}');
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
