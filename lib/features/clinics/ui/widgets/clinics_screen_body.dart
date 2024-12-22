import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:pets_care_app/features/clinics/ui/widgets/clinics_item.dart';
import 'package:pets_care_app/features/store/ui/views/widgets/search_field.dart';

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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SearchField(),
                      verticalSpace(20),
                      Text(
                        "Recommended  Veterinarian",
                        style: AppTextStyles.clinicsTitle
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      verticalSpace(20),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 12.h),
            sliver: SliverList.builder(
              itemCount: 9,
              itemBuilder: (context, index) => const ClinicsItem(),
            ),
          )
        ],
      ),
    );
  }
}
