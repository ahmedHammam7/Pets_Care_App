import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/widgets/app_drop_down_menu.dart';
import 'package:pets_care_app/core/widgets/app_text_field.dart';
import 'package:pets_care_app/core/widgets/custom_app_bar.dart';
import 'package:pets_care_app/features/auth/widgets/primary_button.dart';
import 'package:pets_care_app/features/profile/ui/views/widgets/profile_body_loading.dart';
import 'package:pets_care_app/features/store/store/logic/cubit/store_store_cubit.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: BlocConsumer<StoreStoreCubit, StoreStoreState>(
        buildWhen: (previous, current) =>
            current is AddProductSuccess ||
            current is AddProductFailure ||
            current is AddProductLoading,
        listenWhen: (previous, current) =>
            current is AddProductSuccess ||
            current is AddProductFailure ||
            current is AddProductLoading,
        listener: (context, state) {
          if (state is AddProductSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Product Added Successfully"),
              backgroundColor: Colors.green,
            ));
            Navigator.pop(context);
          }
          if (state is AddProductFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message.toString()),
              backgroundColor: Colors.red,
            ));
          }
        },
        builder: (context, state) {
          if (state is AddProductLoading) {
            return const ProfileBodyLoading();
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Form(
                  key: context.read<StoreStoreCubit>().formKey,
                  child: Column(
                    children: [
                      AppTextField.outsideHint(
                        hint: "Name",
                        controller:
                            context.read<StoreStoreCubit>().nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter name";
                          }
                          return null;
                        },
                      ),
                      verticalSpace(10),
                      AppDropDownMenu(
                        hint: "Category",
                        initialSelection: "food",
                        items: const [
                          "food",
                          "vititems",
                          "accessory",
                          "smart_device"
                        ],
                        controller:
                            context.read<StoreStoreCubit>().categoryController,
                      ),
                      verticalSpace(10),
                      AppTextField.outsideHint(
                        hint: "Price",
                        controller:
                            context.read<StoreStoreCubit>().priceController,
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
                        hint: "Description",
                        controller: context
                            .read<StoreStoreCubit>()
                            .descriptionController,
                        isMultiline: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter description";
                          }
                          return null;
                        },
                      ),
                      verticalSpace(20),
                      AppDropDownMenu(
                        hint: "Type",
                        initialSelection: "dog",
                        items: const ["dog", "cat"],
                        controller:
                            context.read<StoreStoreCubit>().typeController,
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
                                            .read<StoreStoreCubit>()
                                            .image ==
                                        null
                                    ? const AssetImage("assets/png/profile.png")
                                    : FileImage(File(context
                                        .read<StoreStoreCubit>()
                                        .image!
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
                              .read<StoreStoreCubit>()
                              .formKey
                              .currentState!
                              .validate()) {
                            await context.read<StoreStoreCubit>().addProductt();
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Future<File?> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        context.read<StoreStoreCubit>().image = pickedFile;
      });
      return File(pickedFile.path);
    }

    return null;
  }
}
