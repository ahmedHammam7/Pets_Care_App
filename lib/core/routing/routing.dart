import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/di/dependency_injection.dart';
import 'package:pets_care_app/features/add_pets/ui/add_pets_screen.dart';
import 'package:pets_care_app/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:pets_care_app/features/auth/login/ui/views/login_screen.dart';
import 'package:pets_care_app/features/auth/register/logic/cubit/register_cubit.dart';
import 'package:pets_care_app/features/auth/register/ui/views/register_doctor_screen.dart';
import 'package:pets_care_app/features/auth/register/ui/views/register_screen.dart';
import 'package:pets_care_app/features/auth/register/ui/views/register_store_screen.dart';
import 'package:pets_care_app/features/cart/ui/views/cart_screen.dart';
import 'package:pets_care_app/features/chat_bot/ui/chat_bot_screen.dart';
import 'package:pets_care_app/features/check/ui/check_screen.dart';
import 'package:pets_care_app/features/clinics/ui/clinics_screen.dart';
import 'package:pets_care_app/features/clinics/ui/doctor_details_screen.dart';
import 'package:pets_care_app/features/home/ui/views/home_screen.dart';
import 'package:pets_care_app/features/home_layout/ui/home_layout.dart';
import 'package:pets_care_app/features/locations/ui/location_screen.dart';
import 'package:pets_care_app/features/onBoarding/ui/views/on_boarding_screen.dart';
import 'package:pets_care_app/features/profile/ui/views/profile_screen.dart';
import 'package:pets_care_app/features/store/client/data/models/product_model.dart';
import 'package:pets_care_app/features/store/client/logic/cubit/store_cubit.dart';
import 'package:pets_care_app/features/store/client/ui/views/details_screen.dart';
import 'package:pets_care_app/features/store/client/ui/views/store_screen.dart';
import 'package:pets_care_app/features/store/store/logic/cubit/store_store_cubit.dart';
import 'package:pets_care_app/features/store/store/ui/show_products_screen.dart';
import 'package:pets_care_app/features/store/store/ui/add_product_screen.dart';
import 'package:pets_care_app/features/store/store/ui/store_store_screen.dart';
import 'package:pets_care_app/features/store/store/ui/update_info_screen.dart';
import 'package:pets_care_app/features/store/store/ui/update_product_screen.dart';

class AppRoutes {
  Route? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case Routes.profileScreen:
        return MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        );
      case Routes.storeScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<StoreCubit>(),
            child: const StoreScreen(),
          ),
        );
      case Routes.detailsScreen:
        return MaterialPageRoute(
          builder: (context) => const DetailsScreen(),
        );
      case Routes.cartScreen:
        return MaterialPageRoute(
          builder: (context) => const CartScreen(),
        );
      case Routes.clinicsScreen:
        return MaterialPageRoute(
          builder: (context) => const ClinicsScreen(),
        );
      case Routes.doctorDetailsScreen:
        return MaterialPageRoute(
          builder: (context) => const DoctorDetailsScreen(),
        );
      case Routes.addPetsScreen:
        return MaterialPageRoute(
          builder: (context) => const AddPetsScreen(),
        );
      case Routes.registerDoctorScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<RegisterCubit>(),
            child: const RegisterDoctorScreen(),
          ),
        );
      case Routes.registerStoreScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<RegisterCubit>(),
            child: const RegisterStoreScreen(),
          ),
        );
      case Routes.homeLayout:
        return MaterialPageRoute(
          builder: (context) => const HomeLayout(),
        );
      case Routes.checkScreen:
        return MaterialPageRoute(
          builder: (context) => const CheckScreen(),
        );
      case Routes.locationScreen:
        return MaterialPageRoute(
          builder: (context) => const LocationScreen(),
        );
      case Routes.chatBotScreen:
        return MaterialPageRoute(
          builder: (context) => const ChatBotScreen(),
        );
      case Routes.storeStoreScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<StoreStoreCubit>(),
            child: const StoreStoreScreen(),
          ),
        );
      case Routes.storeAddProductScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<StoreStoreCubit>(),
            child: const AddProductScreen(),
          ),
        );
      case Routes.storeShowProductsScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<StoreStoreCubit>()..loadAllProducts(),
            child: const ShowProductsScreen(),
          ),
        );
      case Routes.storeUpdateInfoScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<StoreStoreCubit>()..loadStoreProfile(),
            child: const UpdateInfo(),
          ),
        );
      case Routes.updateProductScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<StoreStoreCubit>(),
            child: UpdateProductScreen(
              data: args as ProductResponse,
            ),
          ),
        );
      default:
        return null;
    }
  }
}
