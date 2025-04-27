part of 'store_cubit.dart';

@freezed
class StoreState with _$StoreState {
  const factory StoreState.initial() = _Initial;
  const factory StoreState.loading() = Loading;
  const factory StoreState.success(
    List<ProductResponse> products,
  ) = Success;
  const factory StoreState.error(String message) = Error;
  // get all stores
  const factory StoreState.allStoresLoading() = AllStoresLoading;
  const factory StoreState.allStoresSuccess(StoreResponse stores) =
      AllStoresSuccess;
  const factory StoreState.allStoresError(String message) = AllStoresError;
  // search stores
  const factory StoreState.searchStoresLoading() = SearchStoresLoading;
  const factory StoreState.searchStoresSuccess(StoreResponse stores) =
      SearchStoresSuccess;
  const factory StoreState.searchStoresError(String message) =
      SearchStoresError;
// getSpecificStoreAndItems
  const factory StoreState.specificStoreLoading() = SpecificStoreLoading;
  const factory StoreState.specificStoreSuccess(SpecificStoreResponse stores) =
      SpecificStoreSuccess;
  const factory StoreState.specificStoreError(String message) =
      SpecificStoreError;
// search items
  const factory StoreState.searchItemsLoading() = SearchItemsLoading;
  const factory StoreState.searchItemsSuccess(SearchItemsResponse items) =
      SearchItemsSuccess;
  const factory StoreState.searchItemsError(String message) = SearchItemsError;
}
