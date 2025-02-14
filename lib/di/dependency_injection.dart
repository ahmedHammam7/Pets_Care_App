import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pets_care_app/core/network/api_service.dart';
import 'package:pets_care_app/core/network/dio_factory.dart';
import 'package:pets_care_app/features/auth/login/data/repos/login_repo.dart';
import 'package:pets_care_app/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:pets_care_app/features/auth/register/data/repos/register_repo.dart';
import 'package:pets_care_app/features/auth/register/logic/cubit/register_cubit.dart';

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
}
