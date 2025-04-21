import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/extension.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:pets_care_app/features/add_pets/logic/cubit/pets_cubit.dart';
import 'package:pets_care_app/features/add_pets/ui/widgets/added_pets_widget.dart';
import 'package:pets_care_app/features/add_pets/ui/widgets/get_pets_loading.dart';
import 'package:pets_care_app/features/add_pets/ui/widgets/manual_add_pets_form.dart';

class AddPetsBody extends StatelessWidget {
  const AddPetsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<PetsCubit, PetsState>(
                buildWhen: (previous, current) =>
                    current is GetAllPetsLoading ||
                    current is GetAllPetsSuccess ||
                    current is GetAllPetsError ||
                    current is DeletePetLoading ||
                    current is DeletePetSuccess ||
                    current is DeletePetError,
                builder: (context, state) {
                  if (state is GetAllPetsSuccess) {
                    if (state.pets.isEmpty) {
                      return const SizedBox.shrink();
                    }
                    return SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.5,
                      child: ListView.builder(
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: AddedPetsWidget(
                            pet: state.pets[index],
                          ),
                        ),
                        itemCount: state.pets.length,
                      ),
                    );
                  } else if (state is GetAllPetsLoading ||
                      state is DeletePetLoading) {
                    return const GetPetsLoading();
                  } else if (state is GetAllPetsError) {
                    return Text(state.message);
                  } else if (state is DeletePetError) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(state.message),
                        backgroundColor: Colors.red,
                      ));
                    });
                  } else if (state is DeletePetSuccess) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      context.pushNamedAndRemoveUntil(
                          Routes.addPetsScreen, (route) => false,
                          predicate: (Route<dynamic> route) => false);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Pet deleted successfully"),
                        backgroundColor: Colors.green,
                      ));
                    });
                  }
                  return const SizedBox.shrink();
                },
              ),
              Text("Manually Add Pet", style: AppTextStyles.recommendedText),
              verticalSpace(10),
              const ManualAddPetsForm(),
            ],
          ),
        ),
      ),
    );
  }
}
