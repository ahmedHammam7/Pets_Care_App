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
  // add product
  const factory StoreStoreState.addProductLoading() = AddProductLoading;
  const factory StoreStoreState.addProductSuccess() = AddProductSuccess;
  const factory StoreStoreState.addProductFailure(String message) =
      AddProductFailure;
  //logout
  const factory StoreStoreState.logout() = Logout;
  //get all products
  const factory StoreStoreState.allProductsLoading() = AllProductsLoading;
  const factory StoreStoreState.allProductsSuccess(List<ProductResponse> data) =
      AllProductsSuccess;
  const factory StoreStoreState.allProductsFailure(String message) =
      AllProductsFailure;

  // delete product
  const factory StoreStoreState.deleteProductLoading() = DeleteProductLoading;
  const factory StoreStoreState.deleteProductSuccess() = DeleteProductSuccess;
  const factory StoreStoreState.deleteProductFailure(String message) =
      DeleteProductFailure;
  //upadte product
  const factory StoreStoreState.updateProductLoading() = UpdateProductLoading;
  const factory StoreStoreState.updateProductSuccess() = UpdateProductSuccess;
  const factory StoreStoreState.updateProductFailure(String message) =
      UpdateProductFailure;
}
