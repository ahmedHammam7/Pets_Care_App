import 'package:flutter/material.dart';
import 'package:pets_care_app/features/cart/data/models/get_cart_response.dart';
import 'package:pets_care_app/features/cart/ui/views/widgets/cart_item.dart';

class CartList extends StatelessWidget {
  const CartList({super.key, required this.cart});
  final GetCartResponse cart;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.6,
      child: ListView.builder(
        itemBuilder: (context, index) => CartItem(
          cartItem: cart.items[index].item,
          quantity: cart.items[index].quantity,
        ),
        itemCount: cart.items.length,
      ),
    );
  }
}
