import 'package:flutter/material.dart';
import 'package:pets_care_app/features/store/client/ui/views/widgets/store_icons.dart';

class StoreIconsRows extends StatelessWidget {
  const StoreIconsRows({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Spacer(),
        StoreIcons(
          image: "assets/png/food_icons.png",
          text: "Food",
        ),
        Spacer(),
        StoreIcons(
          image: "assets/png/vet_items_icons.png",
          text: "Vet Items",
        ),
        Spacer(),
        StoreIcons(
          image: "assets/png/accessories_icon.png",
          text: "Accessories",
        ),
        Spacer(),
        StoreIcons(
          image: "assets/png/smart_icons.png",
          text: "Smart Devices",
        ),
        Spacer(),
      ],
    );
  }
}
