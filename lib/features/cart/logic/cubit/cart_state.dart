part of 'cart_cubit.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _Initial;
  //get cart
  const factory CartState.getCartloading() = GetCartLoading;
  const factory CartState.getCartsuccess(GetCartResponse cart) = GetCartSuccess;
  const factory CartState.getCartfailure(String message) = GetCartFailure;
  // delete cart
  const factory CartState.deleteCartloading() = DeleteCartLoading;
  const factory CartState.deleteCartsuccess() = DeleteCartSuccess;
  const factory CartState.deleteCartfailure(String message) = DeleteCartFailure;
  // checkout
  const factory CartState.checkoutloading() = CheckoutLoading;
  const factory CartState.checkoutsuccess(CheckoutResponse response) =
      CheckoutSuccess;
  const factory CartState.checkoutfailure(String message) = CheckoutFailure;
}
