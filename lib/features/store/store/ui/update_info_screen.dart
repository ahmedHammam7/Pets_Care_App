import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/widgets/app_text_field.dart';
import 'package:pets_care_app/features/auth/widgets/primary_button.dart';
import 'package:pets_care_app/features/profile/ui/views/widgets/profile_body_loading.dart';
import 'package:pets_care_app/features/store/store/logic/cubit/store_store_cubit.dart';

class UpdateInfo extends StatefulWidget {
  const UpdateInfo({super.key});

  @override
  State<UpdateInfo> createState() => _UpdateInfoState();
}

File? image;

class _UpdateInfoState extends State<UpdateInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 24.sp,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: BlocBuilder<StoreStoreCubit, StoreStoreState>(
            buildWhen: (previous, current) => current is Loading ||
             current is Error || current is Success,
            builder: (context, state) {
              if(state is Loading){
                return  const ProfileBodyLoading();
              }
              else {
return   Form(
                key: context.read<StoreStoreCubit>().formKey,
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
                                ? const AssetImage("assets/png/profile.png")
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
                     AppTextField.outsideHint(hint: "Store Name",
                    controller: context.read<StoreStoreCubit>().storeNameController,
                    validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter Store Name";
                          }
                          return null;
                        },
                    ),
                    verticalSpace(10),
                     AppTextField.outsideHint(hint: "Email",
                    controller: context.read<StoreStoreCubit>().emailController,
                    validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter email";
                          }
                          return null;
                        },
                    ),
                    verticalSpace(10),
                     AppTextField.outsideHint(
                      hint: "Hotline",
                      keyboardType: TextInputType.number,
                      numeric: true,
                      controller: context.read<StoreStoreCubit>().hotLineController,
                      validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter Hotline";
                          }
                          return null;
                        },
                    ),
                    verticalSpace(10),
                     AppTextField.outsideHint(
                      hint: "Address",
                      controller: context.read<StoreStoreCubit>().addressController,
                      validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter Address";
                          }
                          return null;
                        },
                    ),
                    verticalSpace(10),
                     AppTextField.outsideHint(
                      hint: "Whatsapp Number",
                      keyboardType: TextInputType.number,
                      numeric: true,
                      controller:
                          context.read<StoreStoreCubit>().whatsappPhoneController,
                      validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter Whatsapp Number";
                          }
                          return null;
                        },
                    ),
                    verticalSpace(20),
                    PrimaryButton(text: "Update", onTap: () async{
                      if(context.read<StoreStoreCubit>().formKey.currentState!.validate()){
                      }
                    })
                  ],
                ),
              );
              }
             
            }
          ),
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
