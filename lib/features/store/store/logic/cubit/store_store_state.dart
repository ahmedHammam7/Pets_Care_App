part of 'store_store_cubit.dart';

@freezed
class StoreStoreState with _$StoreStoreState {
  const factory StoreStoreState.initial() = _Initial;
  //get profile info
  const factory StoreStoreState.loading() = Loading;
  const factory StoreStoreState.success(StoreInfoResponse data) = Success;
  const factory StoreStoreState.failure(String message) = Failure;
  //update profile
  const factory StoreStoreState.updateLoading() = UpdateLoading;
  const factory StoreStoreState.updateSuccess() = UpdateSuccess;
  const factory StoreStoreState.updateFailure(String message) = UpdateFailure;
}
