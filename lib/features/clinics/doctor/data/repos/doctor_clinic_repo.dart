import 'package:pets_care_app/core/helper/shared_prefs/shared_prefs.dart';
import 'package:pets_care_app/core/helper/shared_prefs/shared_prefs_constant.dart';
import 'package:pets_care_app/core/network/api_error_handler.dart';
import 'package:pets_care_app/core/network/api_result.dart';
import 'package:pets_care_app/core/network/api_service.dart';
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
}
