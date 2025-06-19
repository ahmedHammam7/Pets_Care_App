import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/di/dependency_injection.dart';
import 'package:pets_care_app/core/helper/extension.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:pets_care_app/core/widgets/custom_app_bar.dart';
import 'package:pets_care_app/features/add_pets/data/models/pet_response.dart';
import 'package:pets_care_app/features/add_pets/logic/cubit/pets_cubit.dart';
import 'package:pets_care_app/features/add_pets/ui/widgets/activity_loading_widget.dart';
import 'package:pets_care_app/features/add_pets/ui/widgets/location_loading_widget.dart';

class PetDetailsScreen extends StatelessWidget {
  const PetDetailsScreen({
    super.key,
    required this.pet,
  });
  final PetResponse pet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: BlocProvider(
        create: (context) => getIt<PetsCubit>()
          ..getPetActivity(pet.petId.toString())
          ..getPetLocation(pet.petId.toString()),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Card(
            color: AppColors.primaryColor,
            margin: EdgeInsets.zero,
            shadowColor: Colors.black,
            elevation: 8,
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 0.7,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    verticalSpace(10),
                    pet.photo == "" ||
                            pet.photo?.isEmpty == true ||
                            pet.photo == null
                        ? Image.asset(
                            "assets/png/testDog.png",
                            height: 150.h,
                          )
                        : Image.network(
                            pet.photo!,
                            height: 150.h,
                          ),
                    verticalSpace(20),
                    Text(
                      pet.petName,
                      style: AppTextStyles.addedPetstext
                          .copyWith(color: AppColors.white),
                    ),
                    verticalSpace(10),
                    Text(
                      "More Details :",
                      style: AppTextStyles.addedPetstext.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 22.sp,
                          color: AppColors.white),
                    ),
                    verticalSpace(10),
                    Row(
                      children: [
                        const Icon(
                          Icons.color_lens_outlined,
                          color: AppColors.white,
                        ),
                        horizontalSpace(5),
                        Text(
                          pet.color,
                          style: AppTextStyles.addedPetstext
                              .copyWith(color: AppColors.white),
                        ),
                        const Spacer(
                          flex: 4,
                        ),
                        const Icon(
                          Icons.height,
                          color: AppColors.white,
                        ),
                        horizontalSpace(5),
                        Text(
                          pet.height,
                          style: AppTextStyles.addedPetstext
                              .copyWith(color: AppColors.white),
                        ),
                        const Spacer(
                          flex: 4,
                        ),
                        const Icon(
                          Icons.monitor_weight_outlined,
                          color: AppColors.white,
                        ),
                        horizontalSpace(5),
                        Text(
                          pet.weight,
                          style: AppTextStyles.addedPetstext
                              .copyWith(color: AppColors.white),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                      ],
                    ),
                    verticalSpace(10),
                    Row(
                      children: [
                        const Icon(Icons.cake_outlined, color: AppColors.white),
                        horizontalSpace(5),
                        Text(
                          "${pet.age} years",
                          style: AppTextStyles.addedPetstext
                              .copyWith(color: AppColors.white),
                        ),
                        const Spacer(flex: 4),
                        const Icon(
                          Icons.medical_services_outlined,
                          color: AppColors.white,
                        ),
                        horizontalSpace(5),
                        Text(
                          pet.vaccineTime ?? "",
                          style: AppTextStyles.addedPetstext
                              .copyWith(color: AppColors.white),
                        ),
                        const Spacer(flex: 4),
                        const Icon(
                          Icons.pets,
                          color: AppColors.white,
                        ),
                        horizontalSpace(5),
                        Text(
                          pet.petType,
                          style: AppTextStyles.addedPetstext
                              .copyWith(color: AppColors.white),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(flex: 1),
                      ],
                    ),
                    verticalSpace(10),
                    Row(
                      children: [
                        const Icon(
                          Icons.devices,
                          color: AppColors.white,
                        ),
                        horizontalSpace(5),
                        Text(
                          pet.deviceId?.toString() ?? "No Device",
                          style: AppTextStyles.addedPetstext
                              .copyWith(color: AppColors.white),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(flex: 4),
                        pet.gender == "female"
                            ? const Icon(
                                Icons.female,
                                color: AppColors.white,
                              )
                            : const Icon(
                                Icons.male,
                                color: AppColors.white,
                              ),
                        horizontalSpace(5),
                        Text(
                          pet.gender,
                          style: AppTextStyles.addedPetstext
                              .copyWith(color: AppColors.white),
                        ),
                      ],
                    ),
                    verticalSpace(20),
                    BlocBuilder<PetsCubit, PetsState>(
                      buildWhen: (previous, current) =>
                          current is GetPetActivitySuccess ||
                          current is GetPetActivityLoading ||
                          current is GetPetActivityError,
                      builder: (context, state) {
                        if (state is GetPetActivityLoading) {
                          return const ActivityLoadingWidget();
                        } else if (state is GetPetActivitySuccess) {
                          if (state.activity.message
                              .contains("your pet health")) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Current Temperature: ${state.activity.temperature.toString()}",
                                  style: AppTextStyles.addedPetstext.copyWith(
                                    color: state.activity.temperature > 39
                                        ? Colors.red
                                        : Colors.green,
                                  ),
                                ),
                                Text(
                                  "Current Activity: ${state.activity.activity.toString()}",
                                  style: AppTextStyles.addedPetstext.copyWith(
                                    color: state.activity.activity == "low"
                                        ? Colors.red
                                        : Colors.green,
                                  ),
                                ),
                              ],
                            );
                          }
                          return Text(
                            state.activity.message,
                            style: AppTextStyles.addedPetstext,
                          );
                        } else if (state is GetPetActivityError) {
                          return Text(
                            state.message,
                            style: AppTextStyles.addedPetstext
                                .copyWith(color: Colors.red),
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    ),
                    verticalSpace(20),
                    BlocBuilder<PetsCubit, PetsState>(
                      buildWhen: (previous, current) =>
                          current is GetPetLocationSuccess ||
                          current is GetPetLocationLoading ||
                          current is GetPetLocationError,
                      builder: (context, state) {
                        if (state is GetPetLocationLoading) {
                          return const LocationLoadingWidget();
                        }
                        if (state is GetPetLocationSuccess) {
                          if (state.location.message
                              .contains("your pet location")) {
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () async {
                                await context.pushNamed(
                                  Routes.locationScreen,
                                  arguments: {
                                    'lat': state.location.latitude,
                                    'lng': state.location.longitude,
                                  },
                                );
                                // Handle button press
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Last Location",
                                    style: AppTextStyles.addedPetstext.copyWith(
                                        color: AppColors.primaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  horizontalSpace(5),
                                  Icon(Icons.location_on,
                                      color: AppColors.primaryColor,
                                      size: 20.sp),
                                ],
                              ),
                            );
                          }
                          return Text(
                            state.location.message,
                            style: AppTextStyles.addedPetstext,
                          );
                        } else if (state is GetPetLocationError) {
                          return Text(
                            state.message,
                            style: AppTextStyles.addedPetstext
                                .copyWith(color: Colors.red),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
