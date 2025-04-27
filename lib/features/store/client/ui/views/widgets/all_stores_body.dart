import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:pets_care_app/features/store/client/logic/cubit/store_cubit.dart';
import 'package:pets_care_app/features/store/client/ui/views/widgets/all_stores_list.dart';
import 'package:pets_care_app/features/store/client/ui/views/widgets/all_stores_loading.dart';
import 'package:pets_care_app/features/store/client/ui/views/widgets/search_field.dart';

class AllStoresBody extends StatelessWidget {
  const AllStoresBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SearchField(
              onchanged: (value) async {
                await context.read<StoreCubit>().searchStore(value);
              },
            ),
            verticalSpace(10),
            BlocBuilder<StoreCubit, StoreState>(
              buildWhen: (previous, current) =>
                  current is AllStoresLoading ||
                  current is AllStoresSuccess ||
                  current is AllStoresError ||
                  current is SearchStoresSuccess ||
                  current is SearchStoresError ||
                  current is SearchStoresLoading,
              builder: (context, state) {
                if (state is AllStoresLoading || state is SearchStoresLoading) {
                  return const AllStoresLoadingWidget();
                } else if (state is AllStoresSuccess) {
                  return AllStoresList(
                    stores: state.stores,
                  );
                } else if (state is SearchStoresSuccess) {
                  return AllStoresList(
                    stores: state.stores,
                  );
                } else if (state is AllStoresError ||
                    state is SearchStoresError) {
                  return Center(
                    child: Text(
                      "No Stores Found",
                      style: AppTextStyles.homeContainerText
                          .copyWith(color: AppColors.darkGray, fontSize: 30.sp),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
