import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/extension.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:pets_care_app/features/clinics/client/data/models/appoinments_owner_response.dart';
import 'package:pets_care_app/features/clinics/client/logic/cubit/owner_clinics_cubit.dart';
import 'package:pets_care_app/features/store/store/ui/widgets/products_loading.dart';

class AppoinmentsScreen extends StatelessWidget {
  const AppoinmentsScreen({super.key});

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
        centerTitle: true,
        title: Text(
          "Appoinments",
          style: AppTextStyles.clinicsTitle,
        ),
      ),
      body: SafeArea(
        child: BlocConsumer<OwnerClinicsCubit, OwnerClinicsState>(
          listenWhen: (previous, current) =>
              current is DeleteAppointmentFailure ||
              current is DeleteAppointmentSuccess ||
              current is DeleteAppointmentLoading,
          buildWhen: (previous, current) =>
              current is GetAllAppointmentsSuccess ||
              current is GetAllAppointmentsLoading ||
              current is GetAllAppointmentsFailure ||
              current is DeleteAppointmentFailure ||
              current is DeleteAppointmentSuccess ||
              current is DeleteAppointmentLoading,
          listener: (context, state) {
            if (state is DeleteAppointmentFailure) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.message.toString()),
                  backgroundColor: Colors.red,
                ));
              });
            } else if (state is DeleteAppointmentSuccess) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Deleted Successfully"),
                  backgroundColor: Colors.green,
                ));
              });
            }
          },
          builder: (context, state) {
            if (state is GetAllAppointmentsLoading ||
                state is DeleteAppointmentLoading) {
              return const ProductsLoading();
            } else if (state is GetAllAppointmentsFailure) {
              return Center(
                child: Text(
                  state.message,
                  style: AppTextStyles.homeContainerText.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              );
            } else if (state is GetAllAppointmentsSuccess) {
              if (state.appoinments.isEmpty) {
                return Center(
                  child: Text(
                    "No Appoinments",
                    style: AppTextStyles.homeContainerText.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                );
              } else {
                return SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.9,
                  child: ListView.builder(
                    itemBuilder: (context, index) => AppoinmentListItem(
                      appoinment: state.appoinments[index],
                    ),
                    itemCount: state.appoinments.length,
                  ),
                );
              }
            } else if (state is DeleteAppointmentSuccess) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                context.pushReplacementNamed(Routes.appoinmnenstScreen);
              });
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

class AppoinmentListItem extends StatelessWidget {
  const AppoinmentListItem({super.key, required this.appoinment});
  final AppoinmentsOwnerResponse appoinment;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Card(
        color: AppColors.white,
        margin: EdgeInsets.zero,
        shadowColor: Colors.grey,
        elevation: 8,
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Column(
              children: [
                Row(
                  children: [
                    appoinment.pet.photo == "" || appoinment.pet.photo.isEmpty
                        ? Image.asset(
                            "assets/png/cat.png",
                            height: 50.h,
                          )
                        : Image.network(
                            appoinment.pet.photo,
                            height: 50.h,
                          ),
                    horizontalSpace(20),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * .2,
                      child: Text(
                        appoinment.pet.name,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.clinicsTitle.copyWith(
                            fontWeight: FontWeight.w500, fontSize: 18.sp),
                      ),
                    ),
                    Text(
                      appoinment.doctor.price.toString(),
                      style: AppTextStyles.experience,
                    ),
                    Icon(
                      Icons.monetization_on,
                      color: AppColors.storeSizeItemColor,
                      size: 15.sp,
                    ),
                    IconButton(
                      onPressed: () async {
                        await context
                            .read<OwnerClinicsCubit>()
                            .deleteAppoinment(appoinment.id.toString());
                      },
                      icon: Icon(
                        Icons.delete,
                        color: AppColors.red,
                        size: 20.sp,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        await context.pushNamed(Routes.updateAppoinmentScreen,
                            arguments: appoinment);
                      },
                      icon: Icon(
                        Icons.edit,
                        color: AppColors.primaryColor,
                        size: 20.sp,
                      ),
                    )
                  ],
                ),
                verticalSpace(10),
                Row(
                  children: [
                    const Spacer(),
                    Text(
                      appoinment.time,
                      style: AppTextStyles.experience,
                    ),
                    Icon(
                      Icons.timelapse_rounded,
                      color: AppColors.storeSizeItemColor,
                      size: 15.sp,
                    ),
                    const Spacer(),
                    Text(
                      appoinment.day,
                      style: AppTextStyles.experience,
                    ),
                    Icon(
                      Icons.date_range,
                      color: AppColors.storeSizeItemColor,
                      size: 15.sp,
                    ),
                    const Spacer(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
