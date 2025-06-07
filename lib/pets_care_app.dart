import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:pets_care_app/core/helper/constants.dart';
import 'package:pets_care_app/core/helper/no_internet_screen.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/core/routing/routing.dart';
import 'package:pets_care_app/core/themes/colors.dart';

class PetsCareApp extends StatefulWidget {
  const PetsCareApp({super.key});

  @override
  State<PetsCareApp> createState() => _PetsCareAppState();
}

class _PetsCareAppState extends State<PetsCareApp> {
  bool isConnectedInternet = true;
  StreamSubscription? _internetSubscription;

  @override
  void initState() {
    super.initState();
    try {
      _internetSubscription =
          InternetConnection().onStatusChange.listen((status) {
        switch (status) {
          case InternetStatus.connected:
            setState(() => isConnectedInternet = true);
            break;
          case InternetStatus.disconnected:
            setState(() => isConnectedInternet = false);
            break;
        }
      });
    } catch (e) {
      debugPrint("Error initializing internet connection: $e");
    }
  }

  @override
  void dispose() {
    _internetSubscription?.cancel();
    super.dispose();
  }

  checkRoutes() {
    if (isStore == true) {
      return Routes.storeStoreScreen;
    } else if (isClient == true) {
      return Routes.homeLayout;
    } else if (isDoctor == true) {
      return Routes.doctorClincsScreen;
    } else {
      return Routes.onBoardingScreen;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.white,
          appBarTheme: const AppBarTheme(
            surfaceTintColor: AppColors.white,
          ),
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes().onGenerateRoute,
        initialRoute: checkRoutes(),
        builder: (context, child) =>
            isConnectedInternet == true ? child! : const NoInternetScreen(),
      ),
    );
  }
}
