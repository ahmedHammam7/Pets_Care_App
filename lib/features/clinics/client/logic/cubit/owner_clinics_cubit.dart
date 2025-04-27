import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pets_care_app/features/clinics/client/data/models/get_all_clinics_response.dart';
import 'package:pets_care_app/features/clinics/client/data/repos/owner_clincs_repo.dart';

part 'owner_clinics_state.dart';
part 'owner_clinics_cubit.freezed.dart';

class OwnerClinicsCubit extends Cubit<OwnerClinicsState> {
  OwnerClinicsCubit(this._ownerClincsRepo)
      : super(const OwnerClinicsState.initial());
  final OwnerClincsRepo _ownerClincsRepo;

  Future<void> getAllClinics() async {
    emit(const OwnerClinicsState.getAllClinicsLoading());
    final result = await _ownerClincsRepo.getAllClinicsClient();
    result.when(
      success: (response) {
        emit(
          OwnerClinicsState.getAllClinicsSuccess(response),
        );
      },
      failure: (message) {
        emit(
          OwnerClinicsState.getAllClinicsFailure(
            message.getAllErrorMessages(),
          ),
        );
      },
    );
  }

  Future<void> searchClinics(String query) async {
    emit(const SearchClinicsLoading());
    final result = await _ownerClincsRepo.searchClinics(query);
    result.when(
      success: (response) {
        emit(
          OwnerClinicsState.searchClinicsSuccess(response),
        );
      },
      failure: (message) {
        emit(
          OwnerClinicsState.searchClinicsFailure(
            message.getAllErrorMessages(),
          ),
        );
      },
    );
  }
}
