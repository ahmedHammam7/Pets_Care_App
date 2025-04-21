import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/extension.dart';

import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/routing/routes.dart';

import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:pets_care_app/features/add_pets/data/models/pet_response.dart';
import 'package:pets_care_app/features/add_pets/logic/cubit/pets_cubit.dart';

class AddedPetsWidget extends StatelessWidget {
  const AddedPetsWidget({super.key, required this.pet});
  final PetResponse pet;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.addedPets,
      margin: EdgeInsets.zero,
      shadowColor: Colors.grey,
      elevation: 8,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  pet.photo == "" || pet.photo.isEmpty
                      ? Image.asset(
                          "assets/png/testDog.png",
                          height: 61.h,
                        )
                      : Image.network(
                          pet.photo,
                          height: 61.h,
                        ),
                  const Spacer(
                    flex: 4,
                  ),
                  Text(
                    pet.petName,
                    style: AppTextStyles.addedPetstext,
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                  Text(
                    pet.gender,
                    style: AppTextStyles.addedPetstext,
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<PetsCubit>().deletePet(pet.petId.toString());
                    },
                    icon: const Icon(Icons.delete),
                    color: AppColors.red,
                  ),
                  IconButton(
                    onPressed: () async {
                      await context.pushNamed(Routes.editPetScreen,
                          arguments: pet);
                    },
                    icon: const Icon(Icons.edit),
                  ),
                ],
              ),
              verticalSpace(10),
              Text(
                "More Details :",
                style: AppTextStyles.addedPetstext
                    .copyWith(fontWeight: FontWeight.w700, fontSize: 22.sp),
              ),
              verticalSpace(10),
              Row(
                children: [
                  const Icon(Icons.color_lens_outlined),
                  horizontalSpace(5),
                  Text(
                    pet.color,
                    style: AppTextStyles.addedPetstext,
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                  const Icon(Icons.height),
                  horizontalSpace(5),
                  Text(
                    pet.height,
                    style: AppTextStyles.addedPetstext,
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                  const Icon(Icons.monitor_weight_outlined),
                  horizontalSpace(5),
                  Text(
                    pet.weight,
                    style: AppTextStyles.addedPetstext,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                ],
              ),
              verticalSpace(10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Row(
                  children: [
                    const Icon(Icons.cake_outlined),
                    horizontalSpace(5),
                    Text(
                      "${pet.age} years",
                      style: AppTextStyles.addedPetstext,
                    ),
                    horizontalSpace(15),
                    const Icon(Icons.medical_services_outlined),
                    horizontalSpace(5),
                    Text(
                      pet.vaccineTime ?? "",
                      style: AppTextStyles.addedPetstext,
                    ),
                    horizontalSpace(15),
                    const Icon(Icons.pets),
                    horizontalSpace(5),
                    Text(
                      pet.petType,
                      style: AppTextStyles.addedPetstext,
                      overflow: TextOverflow.ellipsis,
                    ),
                    horizontalSpace(5),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
