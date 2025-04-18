import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/widgets/app_text_field.dart';
import 'package:pets_care_app/features/auth/widgets/primary_button.dart';
import 'package:pets_care_app/features/clinics/doctor/logic/cubit/doctor_clinic_cubit.dart';
import 'package:pets_care_app/features/profile/ui/views/widgets/profile_body_loading.dart';

class DoctorProfileBody extends StatefulWidget {
  const DoctorProfileBody({
    super.key,
  });

  @override
  State<DoctorProfileBody> createState() => _ProfileScreenBodyState();
}

File? image;

class _ProfileScreenBodyState extends State<DoctorProfileBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: BlocConsumer<DoctorClinicCubit, DoctorClinicState>(
              buildWhen: (previous, current) =>
                  current is loadDoctorProfileLoading ||
                  current is loadDoctorProfileError ||
                  current is loadDoctorProfileSuccess,
              listenWhen: (previous, current) =>
                  current is loadDoctorProfileLoading ||
                  current is loadDoctorProfileError ||
                  current is loadDoctorProfileSuccess ||
                  current is updateDoctorProfileSuccess ||
                  current is updateDoctorProfileError,
              listener: (context, state) {
                if (state is updateDoctorProfileSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Updated Successfully"),
                    backgroundColor: Colors.green,
                  ));
                  Navigator.pop(context);
                }
                if (state is updateDoctorProfileError) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state.message.toString()),
                    backgroundColor: Colors.red,
                  ));
                }
              },
              builder: (context, state) {
                if (state is loadDoctorProfileLoading) {
                  return const ProfileBodyLoading();
                } else {
                  return Form(
                    key: context.read<DoctorClinicCubit>().formKey,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 100.r,
                              backgroundColor: AppColors.primaryColor,
                              child: CircleAvatar(
                                radius: 96.r,
                                backgroundColor: AppColors.white,
                                backgroundImage: image == null
                                    ? const AssetImage(
                                        "assets/png/portrait-3d-male-doctor.png")
                                    : FileImage(image!),
                              ),
                            ),
                            Positioned(
                              bottom: 6,
                              right: 19,
                              child: CircleAvatar(
                                backgroundColor: AppColors.primaryColor,
                                radius: 18.r,
                                child: CircleAvatar(
                                  radius: 16.r,
                                  backgroundColor: AppColors.white,
                                  child: InkWell(
                                    onTap: () {
                                      pickImage();
                                    },
                                    child: Icon(
                                      Icons.edit_outlined,
                                      color: AppColors.primaryColor,
                                      size: 25.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        AppTextField.outsideHint(
                          hint: "Doctor Name",
                          controller:
                              context.read<DoctorClinicCubit>().nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter Doctor Name";
                            }
                            return null;
                          },
                        ),
                        verticalSpace(10),
                        AppTextField.outsideHint(
                          hint: "Email",
                          controller:
                              context.read<DoctorClinicCubit>().emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter email";
                            }
                            return null;
                          },
                        ),
                        verticalSpace(10),
                        AppTextField.outsideHint(
                          hint: "Phone Number",
                          keyboardType: TextInputType.number,
                          numeric: true,
                          controller:
                              context.read<DoctorClinicCubit>().phoneController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter Phone Number";
                            }
                            return null;
                          },
                        ),
                        verticalSpace(10),
                        AppTextField.outsideHint(
                          hint: "Address",
                          controller: context
                              .read<DoctorClinicCubit>()
                              .addressController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter Address";
                            }
                            return null;
                          },
                        ),
                        verticalSpace(10),
                        AppTextField.outsideHint(
                          hint: "Specialization",
                          controller: context
                              .read<DoctorClinicCubit>()
                              .specializationController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter Specialization";
                            }
                            return null;
                          },
                        ),
                        verticalSpace(10),
                        AppTextField.outsideHint(
                          hint: "Price",
                          numeric: true,
                          keyboardType: TextInputType.number,
                          controller:
                              context.read<DoctorClinicCubit>().priceController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter Price";
                            }
                            return null;
                          },
                        ),
                        verticalSpace(10),
                        AppTextField.outsideHint(
                          hint: "Liscense Number",
                          keyboardType: TextInputType.number,
                          numeric: true,
                          controller: context
                              .read<DoctorClinicCubit>()
                              .licenseNumberController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter Liscense Number";
                            }
                            return null;
                          },
                        ),
                        verticalSpace(10),
                        AppTextField.outsideHint(
                          hint: "Experience Years",
                          keyboardType: TextInputType.number,
                          numeric: true,
                          controller: context
                              .read<DoctorClinicCubit>()
                              .experienceController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter experience years";
                            }
                            return null;
                          },
                        ),
                        verticalSpace(10),
                        AppTextField.outsideHint(
                          hint: "Working Time",
                          controller: context
                              .read<DoctorClinicCubit>()
                              .startTimeController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter Working Time";
                            }
                            return null;
                          },
                        ),
                        verticalSpace(10),
                        AppTextField.outsideHint(
                          hint: "Medical Syndicate Code",
                          keyboardType: TextInputType.number,
                          numeric: true,
                          controller: context
                              .read<DoctorClinicCubit>()
                              .medicalSyndicateCodeController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter Medical Syndicate Code";
                            }
                            return null;
                          },
                        ),
                        verticalSpace(20),
                        PrimaryButton(
                            text: "Update",
                            onTap: () async {
                              if (context
                                  .read<DoctorClinicCubit>()
                                  .formKey
                                  .currentState!
                                  .validate()) {
                                await context
                                    .read<DoctorClinicCubit>()
                                    .updateDoctorProfile();
                              }
                            })
                      ],
                    ),
                  );
                }
              }),
        ),
      ),
    );
  }

  void pickImage() {
    ImagePicker().pickImage(source: ImageSource.gallery).then((value) {
      image = File(value!.path);
    }).then(
      (value) {
        setState(() {});
      },
    );
  }
}
