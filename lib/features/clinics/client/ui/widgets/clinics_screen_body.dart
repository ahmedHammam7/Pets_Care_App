import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:pets_care_app/features/clinics/client/data/models/get_all_clinics_response.dart';
import 'package:pets_care_app/features/clinics/client/logic/cubit/owner_clinics_cubit.dart';
import 'package:pets_care_app/features/clinics/client/ui/widgets/clinics_item.dart';
import 'package:pets_care_app/features/store/client/ui/views/widgets/search_field.dart';
import 'package:shimmer/shimmer.dart';

class ClinicsScreenBody extends StatelessWidget {
  const ClinicsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverLayoutBuilder(
            builder: (context, constraints) => SliverToBoxAdapter(
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                  ),
                  child: SearchField(
                    onchanged: (value) async {
                      await context
                          .read<OwnerClinicsCubit>()
                          .searchClinics(value);
                    },
                  ),
                ),
              ),
            ),
          ),
          BlocBuilder<OwnerClinicsCubit, OwnerClinicsState>(
            buildWhen: (previous, current) =>
                current is GetAllClinicsSuccess ||
                current is GetAllClinicsLoading ||
                current is GetAllClinicsFailure ||
                current is SearchClinicsFailure ||
                current is SearchClinicsSuccess ||
                current is SearchClinicsLoading,
            builder: (context, state) {
              if (state is GetAllClinicsSuccess) {
                return SliverPadding(
                  padding:
                      EdgeInsets.only(left: 12.w, right: 12.w, bottom: 12.h),
                  sliver: SliverList.builder(
                    itemCount: state.getAllClinicsResponse.clinics.length,
                    itemBuilder: (context, index) => ClinicsItem(
                      data: state.getAllClinicsResponse.clinics[index],
                    ),
                  ),
                );
              } else if (state is GetAllClinicsLoading ||
                  state is SearchClinicsLoading) {
                return SliverPadding(
                  padding:
                      EdgeInsets.only(left: 12.w, right: 12.w, bottom: 12.h),
                  sliver: SliverList.builder(
                    itemCount: 9,
                    itemBuilder: (context, index) => Shimmer.fromColors(
                        baseColor: Colors.white,
                        highlightColor: AppColors.storeSizeItemColor,
                        child: ClinicsItem(
                          data: ClinicResponseData(
                              appointmentDate: "appointmentDate",
                              day: "day",
                              time: "time",
                              timeRange: "timeRange",
                              price: "price",
                              address: "address",
                              photo: "",
                              id: 1,
                              doctorName: "doctorName"),
                        )),
                  ),
                );
              } else if (state is GetAllClinicsFailure ||
                  state is SearchClinicsFailure) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      "There is no clinics to show",
                      style: AppTextStyles.homeContainerText
                          .copyWith(color: AppColors.darkGray, fontSize: 30.sp),
                    ),
                  ),
                );
              }
              if (state is SearchClinicsSuccess) {
                return SliverPadding(
                  padding:
                      EdgeInsets.only(left: 12.w, right: 12.w, bottom: 12.h),
                  sliver: SliverList.builder(
                    itemCount: state.getAllClinicsResponse.clinics.length,
                    itemBuilder: (context, index) => ClinicsItem(
                      data: state.getAllClinicsResponse.clinics[index],
                    ),
                  ),
                );
              }
              return const SliverToBoxAdapter(child: SizedBox.shrink());
            },
          )
        ],
      ),
    );
  }
}
