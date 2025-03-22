import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/widgets/app_text_field.dart';
import 'package:pets_care_app/features/auth/widgets/primary_button.dart';

class UpdateProductScreen extends StatelessWidget {
  const UpdateProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
body: SafeArea(child: UpdateProductBody()),
    );
  }
}

class UpdateProductBody extends StatefulWidget {
  const UpdateProductBody({super.key});


  @override
  State<UpdateProductBody> createState() => _UpdateProductBodyState();
}
File? image;

class _UpdateProductBodyState extends State<UpdateProductBody> {
  @override
  Widget build(BuildContext context) {
    return Form(
                    
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
                        AppTextField.outsideHint(
                          hint: "Item Name",
                         
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter Item Name";
                            }
                            return null;
                          },
                        ),
                        verticalSpace(10),
                        AppTextField.outsideHint(
                          hint: "Description",
                        
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter Description";
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
                              return "Please enter Price";
                            }
                            return null;
                          },
                        ),
                        verticalSpace(10),
                        AppTextField.outsideHint(
                          hint: "Category",
                        
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter Category";
                            }
                            return null;
                          },
                        ),
                        verticalSpace(10),
                        AppTextField.outsideHint(
                          hint: "Whatsapp Number",
                          keyboardType: TextInputType.number,
                          numeric: true,
                        
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter Whatsapp Number";
                            }
                            return null;
                          },
                        ),
                        verticalSpace(20),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
                          child: PrimaryButton(
                              text: "Update",
                              onTap: () async {
                              
                              }),
                        )
                      ],
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
              