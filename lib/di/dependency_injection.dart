import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pets_care_app/core/network/api_service.dart';
import 'package:pets_care_app/core/network/dio_factory.dart';
import 'package:pets_care_app/features/auth/login/data/repos/login_repo.dart';
import 'package:pets_care_app/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:pets_care_app/features/auth/register/data/repos/register_repo.dart';
import 'package:pets_care_app/features/auth/register/logic/cubit/register_cubit.dart';
import 'package:pets_care_app/features/clinics/doctor/data/repos/doctor_clinic_repo.dart';
import 'package:pets_care_app/features/clinics/doctor/logic/cubit/doctor_clinic_cubit.dart';
import 'package:pets_care_app/features/profile/data/repos/profile_repo.dart';
import 'package:pets_care_app/features/profile/logic/cubit/profile_cubit.dart';
import 'package:pets_care_app/features/store/client/data/repos/store_repo.dart';
import 'package:pets_care_app/features/store/client/logic/cubit/store_cubit.dart';
import 'package:pets_care_app/features/store/store/data/repos/store_repos.dart';
import 'package:pets_care_app/features/store/store/logic/cubit/store_store_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetit() async {
  Dio dio = DioFactory.getDio();

  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
//signup
  getIt.registerLazySingleton<RegisterRepo>(() => RegisterRepo(getIt()));
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));
  //login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  //Profile
  getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepo(getIt()));
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit(getIt()));
  //store
  getIt.registerLazySingleton<StoreRepo>(() => StoreRepo(getIt()));
  getIt.registerFactory<StoreCubit>(() => StoreCubit(getIt()));
  //store store
  getIt.registerLazySingleton<StoreStoreRepos>(() => StoreStoreRepos(getIt()));
  getIt.registerFactory<StoreStoreCubit>(() => StoreStoreCubit(getIt()));
  // doctor clinic
  getIt
      .registerLazySingleton<DoctorClinicRepo>(() => DoctorClinicRepo(getIt()));
  getIt.registerFactory<DoctorClinicCubit>(() => DoctorClinicCubit(getIt()));
}
