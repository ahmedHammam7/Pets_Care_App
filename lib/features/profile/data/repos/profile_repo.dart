import 'package:pets_care_app/core/helper/shared_prefs/shared_prefs.dart';
import 'package:pets_care_app/core/helper/shared_prefs/shared_prefs_constant.dart';
import 'package:pets_care_app/core/network/api_error_handler.dart';
import 'package:pets_care_app/core/network/api_result.dart';
import 'package:pets_care_app/core/network/api_service.dart';
import 'package:pets_care_app/features/profile/data/models/profile_response.dart';

class ProfileRepo {
  final ApiService _apiService;

  ProfileRepo(this._apiService);

  Future<ApiResult<ProfileResponse>> getUserProfile() async {
    try {
      final response = await _apiService.getUserProfile(
          'Bearer ${await SharedPrefHelper.getSecuredData(SharedPrefsConstant.token)}');
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<dynamic>> updateProfile(Map<String, dynamic> body) async {
    try {
      final response = await _apiService.updateProfile(
          'Bearer ${await SharedPrefHelper.getSecuredData(SharedPrefsConstant.token)}',
          body);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
