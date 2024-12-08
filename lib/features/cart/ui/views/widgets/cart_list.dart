import 'package:flutter/material.dart';
import 'package:pets_care_app/features/cart/ui/views/widgets/cart_item.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.6,
      child: ListView.builder(
        itemBuilder: (context, index) => const CartItem(),
        itemCount: 10,
      ),
    );
  }
}
