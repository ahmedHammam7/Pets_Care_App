import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/widgets/app_text_field.dart';
import 'package:pets_care_app/core/widgets/custom_app_bar.dart';
import 'package:pets_care_app/features/auth/widgets/primary_button.dart';

class AddClinicScreen extends StatefulWidget {
  const AddClinicScreen({super.key});

  @override
  State<AddClinicScreen> createState() => _AddClinicScreenState();
}

class _AddClinicScreenState extends State<AddClinicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppTextField.outsideHint(
                  hint: "Day",
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
                  hint: "Time",
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
                  hint: "Appointment Date",
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
                          // backgroundImage: context
                          //             .read<StoreStoreCubit>()
                          //             .image ==
                          //         null
                          //     ? const AssetImage("assets/png/profile.png")
                          //     : FileImage(File(context
                          //         .read<StoreStoreCubit>()
                          //         .image!
                          //         .path)),
                        ),
                      ),
                    ),
                  ],
                ),
                verticalSpace(20),
                PrimaryButton(
                  text: "Add",
                  onTap: () async {},
                )
              ],
            ),
          ),
        ),
      ),
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
        // context.read<AddAssetCubit>().repeatedExpirationTimeController.text =
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
        // context.read<AddAssetCubit>().repeatedExpirationDateController.text =
        pickedDate.toString();
      });
    }
  }

  Future<void> pickImage() async {
    // context.read<StoreStoreCubit>().image =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {});
  }
}
