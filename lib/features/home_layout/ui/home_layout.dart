import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:pets_care_app/features/check/ui/check_screen.dart';
import 'package:pets_care_app/features/home/ui/views/home_screen.dart';
import 'package:pets_care_app/features/locations/ui/location_screen.dart';
import 'package:pets_care_app/features/profile/ui/views/profile_screen.dart';
import 'package:pets_care_app/features/store/client/ui/views/favourite_screen.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({
    super.key,
  });

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

int currentIndex = 0;

void changeIndex(int index) {
  currentIndex = index;
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      const HomeScreen(),
      const CheckScreen(),
      const FavouriteScreen(),
      const LocationScreen(),
      const ProfileScreen(),
    ];
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primaryColor,
          selectedLabelStyle: AppTextStyles.addedPetstext,
          selectedIconTheme: IconThemeData(size: 30.sp),
          unselectedIconTheme: IconThemeData(size: 30.sp),
          unselectedItemColor: AppColors.storeIconText,
          showUnselectedLabels: true,
          unselectedLabelStyle: AppTextStyles.addedPetstext
              .copyWith(color: AppColors.storeIconText),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.monitor_heart_outlined), label: "Check"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border), label: "Favourite"),
            BottomNavigationBarItem(
                icon: Icon(Icons.location_on_outlined), label: "Locations"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outlined), label: "Profile"),
          ],
          currentIndex: currentIndex,
          onTap: (index) async {
            setState(() {
              changeIndex(index);
            });
          }),
    );
  }
}
