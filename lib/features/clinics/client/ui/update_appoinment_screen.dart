import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/extension.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:pets_care_app/core/widgets/custom_app_bar.dart';
import 'package:pets_care_app/features/auth/widgets/primary_button.dart';
import 'package:pets_care_app/features/clinics/client/data/models/appoinments_owner_response.dart';
import 'package:pets_care_app/features/clinics/client/logic/cubit/owner_clinics_cubit.dart';

class UpdateAppoinmentScreen extends StatefulWidget {
  const UpdateAppoinmentScreen({super.key, required this.data});
  final AppoinmentsOwnerResponse data;
  @override
  State<UpdateAppoinmentScreen> createState() => _UpdateAppoinmentScreenState();
}

DateTime? selectedDate;
TimeOfDay? selectedTime;

class _UpdateAppoinmentScreenState extends State<UpdateAppoinmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: SafeArea(
        child: BlocConsumer<OwnerClinicsCubit, OwnerClinicsState>(
          listenWhen: (previous, current) =>
              current is UpdateAppointmentSuccess ||
              current is UpdateAppointmentFailure ||
              current is UpdateAppointmentLoading,
          buildWhen: (previous, current) =>
              current is UpdateAppointmentSuccess ||
              current is UpdateAppointmentFailure ||
              current is UpdateAppointmentLoading,
          listener: (context, state) {
            if (state is UpdateAppointmentSuccess) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Appoinment Updated Successfully"),
                  backgroundColor: Colors.green,
                ));
              });
            }
            if (state is UpdateAppointmentFailure) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ));
              });
            }
          },
          builder: (context, state) {
            if (state is UpdateAppointmentLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              );
            } else if (state is UpdateAppointmentSuccess) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                context.pushNamedAndRemoveUntil(
                    Routes.homeLayout, (route) => false,
                    predicate: (Route<dynamic> route) => false);
              });
            }
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Card(
                  color: AppColors.addedPets,
                  margin: EdgeInsets.zero,
                  shadowColor: Colors.grey,
                  elevation: 8,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Choose a Date",
                          style: AppTextStyles.choaseDate,
                        ),
                        verticalSpace(15),
                        Center(
                          child: Column(
                            children: [
                              selectedDate == null
                                  ? const Text("Select a Date")
                                  : Text(
                                      "${selectedDate?.day}/${selectedDate?.month}/${selectedDate?.year}",
                                      style: AppTextStyles.pickDateButton
                                          .copyWith(
                                              color: AppColors.primaryColor),
                                    ),
                              TextButton(
                                  onPressed: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: selectedDate,
                                      firstDate: DateTime(2022),
                                      lastDate: DateTime(2030),
                                    );

                                    if (pickedDate != null) {
                                      setState(() {
                                        selectedDate = pickedDate;
                                      });
                                    }
                                  },
                                  style: const ButtonStyle(
                                      backgroundColor: WidgetStatePropertyAll(
                                          AppColors.primaryColor)),
                                  child: Text(
                                    "Select a Date",
                                    style: AppTextStyles.pickDateButton,
                                  )),
                            ],
                          ),
                        ),
                        verticalSpace(15),
                        Text(
                          "Pick a Time",
                          style: AppTextStyles.choaseDate,
                        ),
                        verticalSpace(15),
                        Center(
                          child: Column(
                            children: [
                              selectedTime == null
                                  ? const Text("Select a Time")
                                  : Text(
                                      selectedTime!.format(context),
                                      style: AppTextStyles.pickDateButton
                                          .copyWith(
                                              color: AppColors.primaryColor),
                                    ),
                              TextButton(
                                onPressed: () async {
                                  TimeOfDay? pickedTime = await showTimePicker(
                                    context: context,
                                    initialTime:
                                        selectedTime ?? TimeOfDay.now(),
                                  );
                                  if (pickedTime != null) {
                                    setState(() {
                                      selectedTime = pickedTime;
                                    });
                                  }
                                },
                                style: const ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                        AppColors.primaryColor)),
                                child: Text(
                                  "Select a Time",
                                  style: AppTextStyles.pickDateButton,
                                ),
                              ),
                            ],
                          ),
                        ),
                        verticalSpace(15),
                        PrimaryButton(
                          text: "Update an Appointment",
                          onTap: () async {
                            FormData body = FormData.fromMap({
                              selectedTime == null ? "" : "time":
                                  selectedTime?.format(context).toString(),
                              selectedDate == null ? "" : "day":
                                  "${selectedDate?.day.toString()}/${selectedDate?.month.toString()}/${selectedDate?.year.toString()}",
                            });
                            await context
                                .read<OwnerClinicsCubit>()
                                .updateAppoinment(
                                    widget.data.id.toString(), body);
                          },
                          textstyle: AppTextStyles.addToCartButton,
                          radius: 8,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
