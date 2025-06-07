import 'package:dio/dio.dart';
import 'package:pets_care_app/core/network/api_error_handler.dart';
import 'package:pets_care_app/core/network/api_result.dart';
import 'package:pets_care_app/core/network/api_service.dart';
import 'package:pets_care_app/features/check/data/models/predict_response.dart';

class CheckRepo {
  final ApiService apiService;
  CheckRepo(this.apiService);
  Future<ApiResult<PredictResponse>> checkByAi(FormData body) async {
    try {
      final result = await apiService.checkByAi(body);
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
