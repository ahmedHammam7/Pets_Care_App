import 'package:dio/dio.dart';
import 'package:pets_care_app/core/helper/shared_prefs/shared_prefs.dart';
import 'package:pets_care_app/core/helper/shared_prefs/shared_prefs_constant.dart';
import 'package:pets_care_app/core/network/api_error_handler.dart';
import 'package:pets_care_app/core/network/api_result.dart';
import 'package:pets_care_app/core/network/api_service.dart';
import 'package:pets_care_app/features/clinics/client/data/models/appoinments_owner_response.dart';
import 'package:pets_care_app/features/clinics/client/data/models/get_all_clinics_response.dart';

class OwnerClincsRepo {
  final ApiService _apiService;

  OwnerClincsRepo(this._apiService);

  Future<ApiResult<GetAllClinicsResponse>> getAllClinicsClient() async {
    try {
      final response = await _apiService.getAllClinicsClient(
          'Bearer ${await SharedPrefHelper.getSecuredData(SharedPrefsConstant.token)}');
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<GetAllClinicsResponse>> searchClinics(String query) async {
    try {
      final response = await _apiService.searchClinics(
          'Bearer ${await SharedPrefHelper.getSecuredData(SharedPrefsConstant.token)}',
          query);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<dynamic>> createAppointment(FormData body) async {
    try {
      final response = await _apiService.createAppointment(
          'Bearer ${await SharedPrefHelper.getSecuredData(SharedPrefsConstant.token)}',
          body);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<List<AppoinmentsOwnerResponse>>> getAppoinments() async {
    try {
      final response = await _apiService.getAppoinments(
          'Bearer ${await SharedPrefHelper.getSecuredData(SharedPrefsConstant.token)}');
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<dynamic>> deleteAppoinment(String id) async {
    try {
      final response = await _apiService.deleteAppoinment(
          'Bearer ${await SharedPrefHelper.getSecuredData(SharedPrefsConstant.token)}',
          id);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<dynamic>> updateAppoinment(String id, FormData body) async {
    try {
      final response = await _apiService.updateAppoinment(
          'Bearer ${await SharedPrefHelper.getSecuredData(SharedPrefsConstant.token)}',
          id,
          body);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
