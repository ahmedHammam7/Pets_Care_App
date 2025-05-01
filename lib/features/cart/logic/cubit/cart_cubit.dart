import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pets_care_app/features/cart/data/models/checkout_response.dart';
import 'package:pets_care_app/features/cart/data/models/get_cart_response.dart';
import 'package:pets_care_app/features/cart/data/repos/cart_repo.dart';

part 'cart_state.dart';
part 'cart_cubit.freezed.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this._cartRepos) : super(const CartState.initial());
  final CartRepo _cartRepos;

  Future<void> getCart() async {
    emit(const CartState.getCartloading());
    final result = await _cartRepos.getCart();
    result.when(
      success: (response) {
        emit(CartState.getCartsuccess(response));
      },
      failure: (message) {
        emit(CartState.getCartfailure(message.getAllErrorMessages()));
      },
    );
  }

  Future<void> deleteCart(String id) async {
    emit(const CartState.deleteCartloading());
    final result = await _cartRepos.deleteCart(id);
    result.when(
      success: (response) {
        emit(const CartState.deleteCartsuccess());
      },
      failure: (message) {
        emit(CartState.deleteCartfailure(message.getAllErrorMessages()));
      },
    );
  }

  Future<void> checkout() async {
    emit(const CartState.checkoutloading());
    final result = await _cartRepos.checkout();
    result.when(
      success: (response) {
        emit(CartState.checkoutsuccess(response));
      },
      failure: (message) {
        emit(CartState.checkoutfailure(message.getAllErrorMessages()));
      },
    );
  }
}
