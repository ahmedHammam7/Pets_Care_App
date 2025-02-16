import 'package:dio/dio.dart';
import 'package:pets_care_app/core/network/api_constant.dart';
import 'package:pets_care_app/features/auth/login/data/models/login_response.dart';
import 'package:pets_care_app/features/auth/register/data/models/register_response.dart';
import 'package:pets_care_app/features/profile/data/models/doctor_profile_response.dart';
import 'package:pets_care_app/features/profile/data/models/profile_response.dart';
import 'package:pets_care_app/features/profile/data/models/store_profile_response.dart';
import 'package:retrofit/error_logger.dart';

import 'package:retrofit/http.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstant.register)
  Future<RegisterResponse> register(@Body() Map<String, dynamic> body);

  @POST(ApiConstant.login)
  Future<LoginResponse> login(@Body() Map<String, dynamic> body);

  @GET(ApiConstant.profile)
  Future<ProfileResponse> getUserProfile();

  @GET(ApiConstant.profile)
  Future<DoctorProfileResponse> getDoctorProfile();

  @GET(ApiConstant.profile)
  Future<StoreProfileResponse> getStoreProfile();
}
