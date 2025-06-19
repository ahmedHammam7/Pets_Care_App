import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/extension.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/features/add_pets/logic/cubit/pets_cubit.dart';
import 'package:pets_care_app/features/add_pets/ui/widgets/added_pets_widget.dart';
import 'package:pets_care_app/features/add_pets/ui/widgets/get_pets_loading.dart';

class AddPetsBody extends StatelessWidget {
  const AddPetsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
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
                return const SliverToBoxAdapter(child: SizedBox.shrink());
              }
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                    child: AddedPetsWidget(
                      onTap: () {
                        context.pushNamed(Routes.petsDetailsScreen,
                            arguments: state.pets[index]);
                      },
                      pet: state.pets[index],
                      showUpdateOrDelete: true,
                    ),
                  ),
                  childCount: state.pets.length,
                ),
              );
            } else if (state is GetAllPetsLoading ||
                state is DeletePetLoading) {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                    child: const AddedPetsLoading(),
                  ),
                  childCount: 10,
                ),
              );
            } else if (state is GetAllPetsError) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ));
              });
            } else if (state is DeletePetError) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ));
              });
            } else if (state is DeletePetSuccess) {
              WidgetsBinding.instance.addPostFrameCallback(
                (_) {
                  context.pushNamedAndRemoveUntil(
                      Routes.addPetsScreen, (route) => false,
                      predicate: (Route<dynamic> route) => false);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Pet deleted successfully"),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
              );
            }
            return const SliverToBoxAdapter(child: SizedBox.shrink());
          },
        ),
      ],
    );
  }
}
