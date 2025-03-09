part of 'store_store_cubit.dart';

@freezed
class StoreStoreState with _$StoreStoreState {
  const factory StoreStoreState.initial() = _Initial;
  //get profile info
  const factory StoreStoreState.loading() = Loading;
  const factory StoreStoreState.success(StoreInfoResponse data) = Success;
  const factory StoreStoreState.failure(String message) = Failure;
}
