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
import 'package:pets_care_app/features/clinics/client/data/models/get_all_clinics_response.dart';

class BookAppoinmentBody extends StatelessWidget {
  const BookAppoinmentBody({super.key, required this.clinic});
  final ClinicResponseData clinic;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            children: [
              Text(
                "Choose a Pet",
                style: AppTextStyles.choaseDate
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              verticalSpace(15),
              BlocBuilder<PetsCubit, PetsState>(
                buildWhen: (previous, current) =>
                    current is GetAllPetsLoading ||
                    current is GetAllPetsSuccess ||
                    current is GetAllPetsError,
                builder: (context, state) {
                  if (state is GetAllPetsSuccess) {
                    if (state.pets.isEmpty) {
                      return const SizedBox.shrink();
                    }
                    return SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.8,
                      child: ListView.builder(
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: GestureDetector(
                            onTap: () async {
                              await context.pushNamed(
                                Routes.finishOppointmentScreen,
                                arguments: {
                                  'clinic': clinic,
                                  'pet': state.pets[index],
                                },
                              );
                            },
                            child: AddedPetsWidget(
                              pet: state.pets[index],
                              showUpdateOrDelete: false,
                            ),
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
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
