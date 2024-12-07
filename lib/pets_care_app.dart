import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/core/routing/routing.dart';
import 'package:pets_care_app/core/themes/colors.dart';

class PetsCareApp extends StatelessWidget {
  const PetsCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: AppColors.white),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes().onGenerateRoute,
        initialRoute: Routes.storeScreen,
      ),
    );
  }
}
