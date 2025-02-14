part of 'register_cubit.dart';

@freezed
class RegisterState<T> with _$RegisterState {
  const factory RegisterState.initial() = _Initial;
  const factory RegisterState.loading() = Loading;
  const factory RegisterState.success(T data) = Success;
  const factory RegisterState.error(String message) = Error;
  //registerDoctor state
  const factory RegisterState.registerLoadingDoctor() = RegisterLoadingDoctor;
  const factory RegisterState.registerSuccessDoctor(T data) =
      RegisterSuccessDoctor;
  const factory RegisterState.registerErrorDoctor(String message) =
      RegisterErrorDoctor;
  //registerStore state
  const factory RegisterState.registerLoadingStore() = RegisterLoadingStore;
  const factory RegisterState.registerSuccessStore(T data) =
      RegisterSuccessStore;
  const factory RegisterState.registerErrorStore(String message) =
      RegisterErrorStore;
}
