import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pets_care_app/core/helper/extension.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/widgets/app_text_field.dart';
import 'package:pets_care_app/core/widgets/custom_app_bar.dart';
import 'package:pets_care_app/features/auth/widgets/primary_button.dart';
import 'package:pets_care_app/features/clinics/doctor/data/models/clinic_response.dart';
import 'package:pets_care_app/features/clinics/doctor/logic/cubit/doctor_clinic_cubit.dart';
import 'package:pets_care_app/features/profile/ui/views/widgets/profile_body_loading.dart';

class UpdateClinicScreen extends StatefulWidget {
  const UpdateClinicScreen({super.key, required this.clinic});
  final ClinicResponse clinic;
  @override
  State<UpdateClinicScreen> createState() => _UpdateClinicScreenState();
}

File? image;

class _UpdateClinicScreenState extends State<UpdateClinicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(context),
        body: SingleChildScrollView(
          child: BlocBuilder<DoctorClinicCubit, DoctorClinicState>(
            buildWhen: (previous, current) =>
                current is updateDoctorClinicLoading ||
                current is updateDoctorClinicSuccess ||
                current is updateDoctorClinicError,
            builder: (context, state) {
              if (state is updateDoctorClinicLoading) {
                return const ProfileBodyLoading();
              } else if (state is updateDoctorClinicSuccess) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  context.pushNamed(Routes.doctorShowClinicsScreen);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Updated Successfully"),
                    backgroundColor: Colors.green,
                  ));
                });
              } else if (state is updateDoctorClinicError) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state.message.toString()),
                    backgroundColor: Colors.red,
                  ));
                });
              }
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
                            backgroundImage:
                                context.read<DoctorClinicCubit>().imageFile ==
                                        null
                                    ? NetworkImage(widget.clinic.photo)
                                    : FileImage(File(context
                                        .read<DoctorClinicCubit>()
                                        .imageFile!
                                        .path)),
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
                      hint: "Day",
                      controller:
                          context.read<DoctorClinicCubit>().dayController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter day";
                        }
                        return null;
                      },
                    ),
                    verticalSpace(10),
                    AppTextField.outsideHint(
                      hint: "Address",
                      controller:
                          context.read<DoctorClinicCubit>().addressController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter address";
                        }
                        return null;
                      },
                    ),
                    verticalSpace(10),
                    AppTextField.outsideHint(
                      hint: "Price",
                      controller:
                          context.read<DoctorClinicCubit>().priceController,
                      keyboardType: TextInputType.number,
                      numeric: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter Price";
                        }
                        return null;
                      },
                    ),
                    verticalSpace(20),
                    AppTextField.outsideHint(
                      hint: "Start Time",
                      controller:
                          context.read<DoctorClinicCubit>().startTimeController,
                      insideHint: "-/-/-",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter time";
                        }
                        return null;
                      },
                      maxWidth: 300,
                      suffixIcon: Icon(
                        Icons.calendar_month,
                        color: AppColors.gray,
                      ),
                      onTap: () async {
                        await _selectTime();
                      },
                    ),
                    verticalSpace(10),
                    AppTextField.outsideHint(
                      hint: "End Time",
                      controller:
                          context.read<DoctorClinicCubit>().endTimeController,
                      insideHint: "-/-/-",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter time";
                        }
                        return null;
                      },
                      maxWidth: 300,
                      suffixIcon: Icon(
                        Icons.calendar_month,
                        color: AppColors.gray,
                      ),
                      onTap: () async {
                        await _selectTime2();
                      },
                    ),
                    verticalSpace(10),
                    AppTextField.outsideHint(
                      hint: "Appointment Date",
                      controller: context
                          .read<DoctorClinicCubit>()
                          .appointmentDateController,
                      insideHint: "-/-/-",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter Appointment Date";
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
                    verticalSpace(10),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 10.h),
                      child: PrimaryButton(
                          text: "Update",
                          onTap: () async {
                            if (context
                                .read<DoctorClinicCubit>()
                                .formKey
                                .currentState!
                                .validate()) {
                              await context
                                  .read<DoctorClinicCubit>()
                                  .updateClinic(
                                    widget.clinic.id.toString(),
                                  );
                            }
                          }),
                    )
                  ],
                ),
              );
            },
          ),
        ));
  }

  Future<File?> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        context.read<DoctorClinicCubit>().imageFile = pickedFile;
      });
      return File(pickedFile.path);
    }

    return null;
  }

  Future<void> _selectTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        context.read<DoctorClinicCubit>().startTimeController.text =
            pickedTime.format(context);
      });
    }
  }

  Future<void> _selectTime2() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        context.read<DoctorClinicCubit>().endTimeController.text =
            pickedTime.format(context);
      });
    }
  }

  // select date
  Future<void> _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      setState(() {
        context.read<DoctorClinicCubit>().appointmentDateController.text =
            pickedDate.toString().split(" ").first;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<DoctorClinicCubit>().dayController.text = widget.clinic.day;
    context.read<DoctorClinicCubit>().priceController.text =
        widget.clinic.price;
    context.read<DoctorClinicCubit>().addressController.text =
        widget.clinic.address;
    context.read<DoctorClinicCubit>().startTimeController.text =
        widget.clinic.time;
    context.read<DoctorClinicCubit>().endTimeController.text =
        widget.clinic.endTime;
    context.read<DoctorClinicCubit>().appointmentDateController.text =
        widget.clinic.appointmentDate;
  }
}
