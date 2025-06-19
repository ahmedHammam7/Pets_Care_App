import 'package:dio/dio.dart';
import 'package:pets_care_app/core/helper/shared_prefs/shared_prefs.dart';
import 'package:pets_care_app/core/helper/shared_prefs/shared_prefs_constant.dart';
import 'package:pets_care_app/core/network/api_error_handler.dart';
import 'package:pets_care_app/core/network/api_result.dart';
import 'package:pets_care_app/core/network/api_service.dart';
import 'package:pets_care_app/features/add_pets/data/models/activity_response.dart';
import 'package:pets_care_app/features/add_pets/data/models/pet_response.dart';
import 'package:pets_care_app/features/locations/data/models/location_response.dart';

class PetsRepo {
  final ApiService _apiService;

  PetsRepo(this._apiService);

  Future<ApiResult<List<PetResponse>>> getAllPets() async {
    try {
      final response = await _apiService.getAllPets(
          'Bearer ${await SharedPrefHelper.getSecuredData(SharedPrefsConstant.token)}');
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<dynamic>> addPet(FormData body) async {
    try {
      final response = await _apiService.addPet(
          'Bearer ${await SharedPrefHelper.getSecuredData(SharedPrefsConstant.token)}',
          body);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<dynamic>> deletePet(String id) async {
    try {
      final response = await _apiService.deletePet(
          'Bearer ${await SharedPrefHelper.getSecuredData(SharedPrefsConstant.token)}',
          id);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<dynamic>> updatePet(String id, FormData body) async {
    try {
      final response = await _apiService.updatePet(
          'Bearer ${await SharedPrefHelper.getSecuredData(SharedPrefsConstant.token)}',
          id,
          body);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<ActivityResponse>> getPetActivity(String id) async {
    try {
      final response = await _apiService.getActivity(
          'Bearer ${await SharedPrefHelper.getSecuredData(SharedPrefsConstant.token)}',
          id);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<LocationResponse>> getPetLocation(String id) async {
    try {
      final response = await _apiService.getLocation(
          'Bearer ${await SharedPrefHelper.getSecuredData(SharedPrefsConstant.token)}',
          id);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
