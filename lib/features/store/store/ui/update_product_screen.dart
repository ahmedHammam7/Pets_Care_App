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
import 'package:pets_care_app/features/auth/widgets/primary_button.dart';
import 'package:pets_care_app/features/profile/ui/views/widgets/profile_body_loading.dart';
import 'package:pets_care_app/features/store/client/data/models/product_model.dart';
import 'package:pets_care_app/features/store/store/logic/cubit/store_store_cubit.dart';

class UpdateProductScreen extends StatelessWidget {
  const UpdateProductScreen({super.key, required this.data});
  final ProductResponse data;
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
      body: SafeArea(
          child: BlocListener<StoreStoreCubit, StoreStoreState>(
        listenWhen: (previous, current) =>
            current is UpdateProductSuccess ||
            current is UpdateProductFailure ||
            current is UpdateProductLoading,
        listener: (context, state) async {
          if (state is UpdateProductSuccess) {
            await context.pushNamed(Routes.storeShowProductsScreen);
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Product Updated Successfully"),
              backgroundColor: Colors.green,
            ));
          } else if (state is UpdateProductFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ));
          }
        },
        child: UpdateProductBody(
          data: data,
        ),
      )),
    );
  }
}

class UpdateProductBody extends StatefulWidget {
  const UpdateProductBody({super.key, required this.data});
  final ProductResponse data;

  @override
  State<UpdateProductBody> createState() => _UpdateProductBodyState();
}

File? image;

class _UpdateProductBodyState extends State<UpdateProductBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
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
                        ? NetworkImage(widget.data.image)
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
              controller: context.read<StoreStoreCubit>().nameController,
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
              controller: context.read<StoreStoreCubit>().descriptionController,
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
              controller: context.read<StoreStoreCubit>().priceController,
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
              controller: context.read<StoreStoreCubit>().categoryController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter Category";
                }
                return null;
              },
            ),
            verticalSpace(20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: PrimaryButton(
                  text: "Update",
                  onTap: () async {
                    if (context
                        .read<StoreStoreCubit>()
                        .formKey
                        .currentState!
                        .validate()) {
                      await context.read<StoreStoreCubit>().updateProduct(
                            widget.data.id.toString(),
                          );
                    }
                  }),
            )
          ],
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

  @override
  void initState() {
    context.read<StoreStoreCubit>().nameController.text = widget.data.name;
    context.read<StoreStoreCubit>().descriptionController.text =
        widget.data.description;
    context.read<StoreStoreCubit>().priceController.text = widget.data.price;
    context.read<StoreStoreCubit>().categoryController.text = "food";
    context.read<StoreStoreCubit>().typeController.text = widget.data.foodType;

    super.initState();
  }
}
