import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pets_care_app/core/helper/extension.dart';

import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/widgets/app_text_field.dart';
import 'package:pets_care_app/core/widgets/custom_app_bar.dart';
import 'package:pets_care_app/features/auth/widgets/primary_button.dart';
import 'package:pets_care_app/features/clinics/doctor/logic/cubit/doctor_clinic_cubit.dart';

class AddClinicScreen extends StatefulWidget {
  const AddClinicScreen({super.key});

  @override
  State<AddClinicScreen> createState() => _AddClinicScreenState();
}

class _AddClinicScreenState extends State<AddClinicScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorClinicCubit, DoctorClinicState>(
      buildWhen: (previous, current) =>
          current is addDoctorClinicLoading ||
          current is addDoctorClinicSuccess ||
          current is addDoctorClinicError,
      builder: (context, state) {
        if (state is addDoctorClinicSuccess) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.pop();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Clinic added successfully"),
              backgroundColor: Colors.green,
            ));
          });
        } else if (state is addDoctorClinicError) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message.toString()),
              backgroundColor: Colors.red,
            ));
          });
        }
        return Scaffold(
          appBar: customAppBar(
            context,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Form(
                key: context.read<DoctorClinicCubit>().formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                      hint: "Price",
                      controller:
                          context.read<DoctorClinicCubit>().priceController,
                      keyboardType: TextInputType.number,
                      numeric: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter price";
                        }
                        return null;
                      },
                    ),
                    verticalSpace(10),
                    AppTextField.outsideHint(
                      hint: "Address",
                      controller:
                          context.read<DoctorClinicCubit>().addressController,
                      isMultiline: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter address";
                        }
                        return null;
                      },
                    ),
                    verticalSpace(10),
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
                                          .read<DoctorClinicCubit>()
                                          .imageFile ==
                                      null
                                  ? const AssetImage("assets/png/profile.png")
                                  : FileImage(File(context
                                      .read<DoctorClinicCubit>()
                                      .imageFile!
                                      .path)),
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
                            .read<DoctorClinicCubit>()
                            .formKey
                            .currentState!
                            .validate()) {
                          await context.read<DoctorClinicCubit>().addClinic();
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
    );
  }

  // select time
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
}
