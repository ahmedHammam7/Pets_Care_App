import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:pets_care_app/features/auth/widgets/primary_button.dart';

class ChoaseAppointmentWidget extends StatefulWidget {
  const ChoaseAppointmentWidget({super.key});

  @override
  State<ChoaseAppointmentWidget> createState() => _ChoaseAppointmentBodyState();
}

DateTime selectedDate = DateTime.now();
TimeOfDay selectedTime = TimeOfDay.now();

class _ChoaseAppointmentBodyState extends State<ChoaseAppointmentWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
        child: SingleChildScrollView(
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
                    Text(
                      "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                      style: AppTextStyles.pickDateButton
                          .copyWith(color: AppColors.primaryColor),
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
                            backgroundColor:
                                WidgetStatePropertyAll(AppColors.primaryColor)),
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
                    Text(
                      selectedTime.format(context),
                      style: AppTextStyles.pickDateButton
                          .copyWith(color: AppColors.primaryColor),
                    ),
                    TextButton(
                      onPressed: () async {
                        TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: selectedTime,
                        );
                        if (pickedTime != null) {
                          setState(() {
                            selectedTime = pickedTime;
                          });
                        }
                      },
                      style: const ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(AppColors.primaryColor)),
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
                text: "Book an Appointment",
                onTap: () {},
                textstyle: AppTextStyles.addToCartButton,
                radius: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
