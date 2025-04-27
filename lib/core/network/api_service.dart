import 'package:dio/dio.dart';
import 'package:pets_care_app/core/network/api_constant.dart';
import 'package:pets_care_app/features/add_pets/data/models/pet_response.dart';
import 'package:pets_care_app/features/auth/login/data/models/login_response.dart';
import 'package:pets_care_app/features/auth/register/data/models/register_response.dart';
import 'package:pets_care_app/features/clinics/doctor/data/models/appoinment_doc_response.dart';
import 'package:pets_care_app/features/clinics/doctor/data/models/clinic_response.dart';
import 'package:pets_care_app/features/clinics/doctor/data/models/doctor_profile_response.dart';
import 'package:pets_care_app/features/profile/data/models/profile_response.dart';
import 'package:pets_care_app/features/store/client/data/models/product_model.dart';
import 'package:pets_care_app/features/store/client/data/models/search_items_response.dart';
import 'package:pets_care_app/features/store/client/data/models/specific_store_item.dart';
import 'package:pets_care_app/features/store/client/data/models/store_response.dart';
import 'package:pets_care_app/features/store/store/data/models/store_info_response.dart';
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
  Future<ProfileResponse> getUserProfile(@Header('Authorization') String token);

  @GET(ApiConstant.profile)
  Future<DoctorProfileResponse> getDoctorProfile(
      @Header('Authorization') String token);

  @GET(ApiConstant.profile)
  Future<StoreInfoResponse> getStoreProfile(
      @Header('Authorization') String token);
  @GET(ApiConstant.items)
  Future<List<ProductResponse>> getAllProducts(
      @Header('Authorization') String token);

  @POST(ApiConstant.profile)
  Future<dynamic> updateProfile(
      @Header('Authorization') String token, @Body() Map<String, dynamic> body);

  @POST(ApiConstant.items)
  Future<dynamic> addProduct(
      @Header('Authorization') String token, @Body() dynamic body);

  @DELETE('${ApiConstant.items}/{id}')
  Future<dynamic> deleteProduct(
      @Header('Authorization') String token, @Path('id') String id);
  @POST('${ApiConstant.items}/{id}')
  Future<dynamic> updateProduct(@Header('Authorization') String token,
      @Path('id') String id, @Body() dynamic body);
  @DELETE('${ApiConstant.clinics}/{id}')
  Future<dynamic> deleteClinic(
      @Header('Authorization') String token, @Path('id') String id);
  @GET(ApiConstant.clinics)
  Future<List<ClinicResponse>> getAllClinics(
      @Header('Authorization') String token);
  @POST(ApiConstant.clinics)
  Future<dynamic> addClinic(
      @Header('Authorization') String token, @Body() dynamic body);
  @GET(ApiConstant.doctorAppointments)
  Future<AppoinmentDocResponse> getAllDoctorAppointments(
      @Header('Authorization') String token);

  @POST('${ApiConstant.clinics}/{id}')
  Future<dynamic> updateClinic(@Header('Authorization') String token,
      @Path('id') String id, @Body() dynamic body);
  @GET(ApiConstant.pets)
  Future<List<PetResponse>> getAllPets(@Header('Authorization') String token);
  @POST(ApiConstant.pets)
  Future<dynamic> addPet(
      @Header('Authorization') String token, @Body() dynamic body);
  @DELETE('${ApiConstant.pets}/{id}')
  Future<dynamic> deletePet(
      @Header('Authorization') String token, @Path('id') String id);

  @POST('${ApiConstant.pets}/{id}')
  Future<dynamic> updatePet(@Header('Authorization') String token,
      @Path('id') String id, @Body() dynamic body);

  @GET(ApiConstant.stores)
  Future<StoreResponse> getAllStores(@Header('Authorization') String token);

  @GET('${ApiConstant.searchStore}{query}')
  Future<StoreResponse> searchStore(
      @Header('Authorization') String token, @Path('query') String query);
  @GET('${ApiConstant.stores}/{id}')
  Future<SpecificStoreResponse> getSpecificStoreAndItems(
    @Header('Authorization') String token,
    @Path('id') String id,
  );
  @GET('${ApiConstant.searchItems}{query}')
  Future<SearchItemsResponse> searchItems(
      @Header('Authorization') String token, @Path('query') String query);
}
