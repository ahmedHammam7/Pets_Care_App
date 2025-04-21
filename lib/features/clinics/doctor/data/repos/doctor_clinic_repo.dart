import 'package:dio/dio.dart';
import 'package:pets_care_app/core/helper/shared_prefs/shared_prefs.dart';
import 'package:pets_care_app/core/helper/shared_prefs/shared_prefs_constant.dart';
import 'package:pets_care_app/core/network/api_error_handler.dart';
import 'package:pets_care_app/core/network/api_result.dart';
import 'package:pets_care_app/core/network/api_service.dart';
import 'package:pets_care_app/features/clinics/doctor/data/models/appoinment_doc_response.dart';
import 'package:pets_care_app/features/clinics/doctor/data/models/clinic_response.dart';
import 'package:pets_care_app/features/clinics/doctor/data/models/doctor_profile_response.dart';

class DoctorClinicRepo {
  final ApiService _apiService;

  DoctorClinicRepo(this._apiService);
  Future<ApiResult<DoctorProfileResponse>> getDoctorProfile() async {
    try {
      final response = await _apiService.getDoctorProfile(
          'Bearer ${await SharedPrefHelper.getSecuredData(SharedPrefsConstant.token)}');
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<dynamic>> updateDoctorProfile(
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

  Future<ApiResult<dynamic>> deleteClinic(String id) async {
    try {
      final response = await _apiService.deleteClinic(
          'Bearer ${await SharedPrefHelper.getSecuredData(SharedPrefsConstant.token)}',
          id);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<List<ClinicResponse>>> getAllClinics() async {
    try {
      final response = await _apiService.getAllClinics(
          'Bearer ${await SharedPrefHelper.getSecuredData(SharedPrefsConstant.token)}');
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<AppoinmentDocResponse>> getAllDoctorAppointments() async {
    try {
      final response = await _apiService.getAllDoctorAppointments(
          'Bearer ${await SharedPrefHelper.getSecuredData(SharedPrefsConstant.token)}');
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<dynamic>> addClinic(FormData formData) async {
    try {
      final response = await _apiService.addClinic(
          'Bearer ${await SharedPrefHelper.getSecuredData(SharedPrefsConstant.token)}',
          formData);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<dynamic>> updateClinic(String id, FormData formData) async {
    try {
      final response = await _apiService.updateClinic(
          'Bearer ${await SharedPrefHelper.getSecuredData(SharedPrefsConstant.token)}',
          id,
          formData);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
