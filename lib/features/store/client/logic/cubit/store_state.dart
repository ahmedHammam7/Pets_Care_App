part of 'store_cubit.dart';

@freezed
class StoreState with _$StoreState {
  const factory StoreState.initial() = _Initial;
  const factory StoreState.loading() = Loading;
  const factory StoreState.success(
    List<ProductResponse> products,
  ) = Success;
  const factory StoreState.error(String message) = Error;
}
