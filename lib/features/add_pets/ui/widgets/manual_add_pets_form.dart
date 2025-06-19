import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pets_care_app/core/helper/extension.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/widgets/app_drop_down_menu.dart';
import 'package:pets_care_app/core/widgets/app_text_field.dart';
import 'package:pets_care_app/core/widgets/custom_app_bar.dart';
import 'package:pets_care_app/features/add_pets/logic/cubit/pets_cubit.dart';
import 'package:pets_care_app/features/add_pets/ui/widgets/add_pets_loading.dart';
import 'package:pets_care_app/features/auth/widgets/primary_button.dart';

class ManualAddPetsForm extends StatefulWidget {
  const ManualAddPetsForm({super.key});

  @override
  State<ManualAddPetsForm> createState() => _ManualAddPetsFormState();
}

class _ManualAddPetsFormState extends State<ManualAddPetsForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: BlocBuilder<PetsCubit, PetsState>(
        buildWhen: (previous, current) =>
            current is AddPetLoading ||
            current is AddPetSuccess ||
            current is AddPetError,
        builder: (context, state) {
          if (state is AddPetLoading) {
            return const AddPetsLoading();
          } else if (state is AddPetSuccess) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.pushReplacementNamed(
                Routes.homeLayout,
              );
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Pet added successfully"),
                backgroundColor: Colors.green,
              ));
            });
          } else if (state is AddPetError) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ));
            });
          }
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Form(
                  key: context.read<PetsCubit>().addPetFormKey,
                  child: Column(
                    children: [
                      AppTextField.outsideHint(
                        hint: "Pet Name",
                        controller: context.read<PetsCubit>().petNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter pet name";
                          }
                          return null;
                        },
                      ),
                      verticalSpace(10),
                      AppTextField.outsideHint(
                        hint: "Height",
                        controller:
                            context.read<PetsCubit>().petHeightController,
                        keyboardType: TextInputType.number,
                        numeric: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter height";
                          }
                          return null;
                        },
                      ),
                      verticalSpace(10),
                      AppTextField.outsideHint(
                        hint: "Weight",
                        controller:
                            context.read<PetsCubit>().petWeightController,
                        keyboardType: TextInputType.number,
                        numeric: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter height";
                          }
                          return null;
                        },
                      ),
                      verticalSpace(10),
                      AppTextField.outsideHint(
                        hint: "Age",
                        controller: context.read<PetsCubit>().petAgeController,
                        keyboardType: TextInputType.number,
                        numeric: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter age";
                          }
                          return null;
                        },
                      ),
                      verticalSpace(10),
                      AppTextField.outsideHint(
                        hint: "Color",
                        controller:
                            context.read<PetsCubit>().petColorController,
                        isMultiline: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter color";
                          }
                          return null;
                        },
                      ),
                      verticalSpace(10),
                      AppTextField.outsideHint(
                        hint: "ْCollar number",
                        controller:
                            context.read<PetsCubit>().deviceIdController,
                        keyboardType: TextInputType.text,
                      ),
                      verticalSpace(20),
                      AppDropDownMenu(
                        hint: "Type",
                        initialSelection: "dog",
                        items: const ["dog", "cat"],
                        controller: context.read<PetsCubit>().petTypeController,
                      ),
                      verticalSpace(20),
                      AppDropDownMenu(
                        hint: "Gender",
                        initialSelection: "male",
                        items: const ["male", "female"],
                        controller:
                            context.read<PetsCubit>().petGenderController,
                      ),
                      verticalSpace(20),
                      AppTextField.outsideHint(
                        hint: "Vaccine Date",
                        controller:
                            context.read<PetsCubit>().petVaccineTimeController,
                        insideHint: "-/-/-",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter vaccine Date";
                          }
                          return null;
                        },
                        maxWidth: 300,
                        suffixIcon: Icon(
                          Icons.calendar_month,
                          color: AppColors.gray,
                        ),
                        onTap: () async {
                          await _selectDate();
                        },
                      ),
                      verticalSpace(20),
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 100.r,
                            backgroundColor: AppColors.primaryColor,
                            child: GestureDetector(
                              onTap: () async {
                                await pickImage();
                              },
                              child: CircleAvatar(
                                radius: 96.r,
                                backgroundColor: AppColors.white,
                                backgroundImage: context
                                            .read<PetsCubit>()
                                            .photo ==
                                        null
                                    ? const AssetImage("assets/png/cat.png")
                                    : FileImage(File(
                                        context.read<PetsCubit>().photo!.path)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(20),
                      PrimaryButton(
                        text: "Add",
                        onTap: () async {
                          if (context
                              .read<PetsCubit>()
                              .addPetFormKey
                              .currentState!
                              .validate()) {
                            await context.read<PetsCubit>().addPet();
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<File?> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        context.read<PetsCubit>().photo = pickedFile;
      });
      return File(pickedFile.path);
    }

    return null;
  }

  Future<void> _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      setState(() {
        context.read<PetsCubit>().petVaccineTimeController.text =
            pickedDate.toString().split(" ").first;
      });
    }
  }
}
