import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/extension.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:pets_care_app/features/add_pets/data/models/pet_response.dart';
import 'package:pets_care_app/features/add_pets/logic/cubit/pets_cubit.dart';

class AddedPetsWidget extends StatelessWidget {
  const AddedPetsWidget(
      {super.key,
      required this.pet,
      required this.showUpdateOrDelete,
      this.onTap});
  final PetResponse pet;
  final bool showUpdateOrDelete;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: AppColors.primaryColor,
        margin: EdgeInsets.zero,
        shadowColor: Colors.grey,
        elevation: 8,
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.10,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    pet.photo == "" ||
                            pet.photo?.isEmpty == true ||
                            pet.photo == null
                        ? Image.asset(
                            "assets/png/testDog.png",
                            height: 61.h,
                          )
                        : Image.network(
                            pet.photo!,
                            height: 61.h,
                          ),
                    const Spacer(),
                    Text(
                      pet.petName,
                      style: AppTextStyles.addedPetstext
                          .copyWith(color: AppColors.white),
                    ),
                    const Spacer(),
                    showUpdateOrDelete
                        ? IconButton(
                            onPressed: () {
                              context
                                  .read<PetsCubit>()
                                  .deletePet(pet.petId.toString());
                            },
                            icon: const Icon(Icons.delete),
                            color: AppColors.red,
                          )
                        : const SizedBox.shrink(),
                    const Spacer(),
                    showUpdateOrDelete
                        ? IconButton(
                            onPressed: () async {
                              await context.pushNamed(Routes.editPetScreen,
                                  arguments: pet);
                            },
                            icon:
                                const Icon(Icons.edit, color: AppColors.white),
                          )
                        : const SizedBox.shrink(),
                    const Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
