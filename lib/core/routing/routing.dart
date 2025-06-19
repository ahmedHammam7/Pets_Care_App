import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/core/di/dependency_injection.dart';
import 'package:pets_care_app/features/add_pets/data/models/pet_response.dart';
import 'package:pets_care_app/features/add_pets/logic/cubit/pets_cubit.dart';
import 'package:pets_care_app/features/add_pets/ui/add_pets_screen.dart';
import 'package:pets_care_app/features/add_pets/ui/edit_pet_screen.dart';
import 'package:pets_care_app/features/add_pets/ui/pet_details_screen.dart';
import 'package:pets_care_app/features/add_pets/ui/widgets/manual_add_pets_form.dart';
import 'package:pets_care_app/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:pets_care_app/features/auth/login/ui/views/login_screen.dart';
import 'package:pets_care_app/features/auth/register/logic/cubit/register_cubit.dart';
import 'package:pets_care_app/features/auth/register/ui/views/register_doctor_screen.dart';
import 'package:pets_care_app/features/auth/register/ui/views/register_screen.dart';
import 'package:pets_care_app/features/auth/register/ui/views/register_store_screen.dart';
import 'package:pets_care_app/features/cart/logic/cubit/cart_cubit.dart';
import 'package:pets_care_app/features/cart/ui/views/cart_screen.dart';
import 'package:pets_care_app/features/cart/ui/views/pick_order_screen.dart';
import 'package:pets_care_app/features/chat_bot/ui/chat_bot_screen.dart';
import 'package:pets_care_app/features/check/logic/cubit/check_cubit.dart';
import 'package:pets_care_app/features/check/ui/check_screen.dart';
import 'package:pets_care_app/features/clinics/client/data/models/appoinments_owner_response.dart';
import 'package:pets_care_app/features/clinics/client/data/models/get_all_clinics_response.dart';
import 'package:pets_care_app/features/clinics/client/logic/cubit/owner_clinics_cubit.dart';
import 'package:pets_care_app/features/clinics/client/ui/appoinments_screen.dart';
import 'package:pets_care_app/features/clinics/client/ui/book_appoinment_screen.dart';
import 'package:pets_care_app/features/clinics/client/ui/clinics_screen.dart';
import 'package:pets_care_app/features/clinics/client/ui/doctor_details_screen.dart';
import 'package:pets_care_app/features/clinics/client/ui/finish_appoinment_screen.dart';
import 'package:pets_care_app/features/clinics/client/ui/update_appoinment_screen.dart';
import 'package:pets_care_app/features/clinics/doctor/data/models/appoinment_doc_response.dart';
import 'package:pets_care_app/features/clinics/doctor/data/models/clinic_response.dart';
import 'package:pets_care_app/features/clinics/doctor/logic/cubit/doctor_clinic_cubit.dart';
import 'package:pets_care_app/features/clinics/doctor/ui/add_clinic_screen.dart';
import 'package:pets_care_app/features/clinics/doctor/ui/appoinment_details_screen.dart';
import 'package:pets_care_app/features/clinics/doctor/ui/doctor_clincs_screen.dart';
import 'package:pets_care_app/features/clinics/doctor/ui/show_appoinments_screen.dart';
import 'package:pets_care_app/features/clinics/doctor/ui/show_clincs_screen.dart';
import 'package:pets_care_app/features/clinics/doctor/ui/update_clinic_screen.dart';
import 'package:pets_care_app/features/clinics/doctor/ui/update_info_screen.dart';
import 'package:pets_care_app/features/home/ui/views/home_screen.dart';
import 'package:pets_care_app/features/home_layout/ui/home_layout.dart';
import 'package:pets_care_app/features/locations/ui/location_screen.dart';
import 'package:pets_care_app/features/onBoarding/ui/views/on_boarding_screen.dart';
import 'package:pets_care_app/features/profile/logic/cubit/profile_cubit.dart';
import 'package:pets_care_app/features/profile/ui/views/profile_screen.dart';
import 'package:pets_care_app/features/store/client/data/models/product_model.dart';
import 'package:pets_care_app/features/store/client/logic/cubit/store_cubit.dart';
import 'package:pets_care_app/features/store/client/ui/views/all_stores_screen.dart';
import 'package:pets_care_app/features/store/client/ui/views/details_screen.dart';
import 'package:pets_care_app/features/store/client/ui/views/favourite_screen.dart';
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
            child: StoreScreen(
              id: args as String,
            ),
          ),
        );

      case Routes.detailsScreen:
        final arguments = args as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<StoreCubit>(),
            child: DetailsScreen(
              item: arguments["item"],
              id: arguments["id"],
            ),
          ),
        );
      case Routes.cartScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<CartCubit>()..getCart(),
            child: const CartScreen(),
          ),
        );
      case Routes.clinicsScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<OwnerClinicsCubit>()..getAllClinics(),
            child: const ClinicsScreen(),
          ),
        );

      case Routes.addPetsScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<PetsCubit>()..getAllPets(),
            child: const AddPetsScreen(),
          ),
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
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<ProfileCubit>()..loadUserProfile(),
              ),
              BlocProvider(
                create: (context) => getIt<StoreCubit>()..getRecommendedFood(),
              ),
              BlocProvider(
                create: (context) => getIt<PetsCubit>()..getAllPets(),
              ),
              BlocProvider(
                create: (context) => getIt<CheckCubit>(),
              ),
            ],
            child: const HomeLayout(),
          ),
        );
      case Routes.checkScreen:
        return MaterialPageRoute(
          builder: (context) => const CheckScreen(),
        );
      case Routes.locationScreen:
        final arguments = args as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => LocationScreen(
            lat: arguments['lat'] as double,
            lng: arguments['lng'] as double,
          ),
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
      case Routes.doctorClincsScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<DoctorClinicCubit>(),
            child: const DoctorClincsScreen(),
          ),
        );
      case Routes.doctorAddClinicScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<DoctorClinicCubit>(),
            child: const AddClinicScreen(),
          ),
        );
      case Routes.doctorShowClinicsScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<DoctorClinicCubit>()..getAllClinics(),
            child: const ShowClincsScreen(),
          ),
        );
      case Routes.doctorUpdateInfoScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                getIt<DoctorClinicCubit>()..loadDoctorProfile(),
            child: const DoctorUpdateInfoScreen(),
          ),
        );
      case Routes.doctorShowAppointmentsScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                getIt<DoctorClinicCubit>()..getAllDoctorAppointments(),
            child: const ShowAppoinmentsScreen(),
          ),
        );
      case Routes.doctorAppointmentsDetailsScreen:
        return MaterialPageRoute(
          builder: (context) => AppoinmentDetailsScreen(
            data: args as AppoinmentDocData,
          ),
        );
      case Routes.doctorUpdateClinicScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<DoctorClinicCubit>(),
            child: UpdateClinicScreen(
              clinic: args as ClinicResponse,
            ),
          ),
        );
      case Routes.editPetScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<PetsCubit>(),
            child: EditPetScreen(
              pet: args as PetResponse,
            ),
          ),
        );
      case Routes.allStoresScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<StoreCubit>()..getAllStores(),
            child: const AllStoresScreen(),
          ),
        );
      case Routes.pickeOrderScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<CartCubit>()..checkout(),
            child: const PickOrderScreen(),
          ),
        );
      case Routes.doctorDetailsScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<OwnerClinicsCubit>(),
            child: DoctorDetailsScreen(
              data: args as ClinicResponseData,
            ),
          ),
        );
      case Routes.bookAppointmentScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<PetsCubit>()..getAllPets(),
            child: BookAppoinmentScreen(
              clinic: args as ClinicResponseData,
            ),
          ),
        );
      case Routes.finishOppointmentScreen:
        final arguments = args as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<OwnerClinicsCubit>(),
            child: FinishAppoinmentScreen(
              clinic: arguments['clinic'] as ClinicResponseData,
              pet: arguments['pet'] as PetResponse,
            ),
          ),
        );
      case Routes.appoinmnenstScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                getIt<OwnerClinicsCubit>()..getAllAppointments(),
            child: const AppoinmentsScreen(),
          ),
        );
      case Routes.updateAppoinmentScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<OwnerClinicsCubit>(),
            child: UpdateAppoinmentScreen(
              data: args as AppoinmentsOwnerResponse,
            ),
          ),
        );
      case Routes.favoritesScreen:
        return MaterialPageRoute(
          builder: (context) => const FavouriteScreen(),
        );
      case Routes.addPetsForm:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<PetsCubit>(),
            child: const ManualAddPetsForm(),
          ),
        );
      case Routes.petsDetailsScreen:
        return MaterialPageRoute(
          builder: (context) => PetDetailsScreen(pet: args as PetResponse),
        );
      default:
        return null;
    }
  }
}
