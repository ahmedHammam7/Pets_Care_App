part of 'owner_clinics_cubit.dart';

@freezed
class OwnerClinicsState with _$OwnerClinicsState {
  const factory OwnerClinicsState.initial() = _Initial;
  // get all clinics
  const factory OwnerClinicsState.getAllClinicsLoading() = GetAllClinicsLoading;
  const factory OwnerClinicsState.getAllClinicsSuccess(
      GetAllClinicsResponse getAllClinicsResponse) = GetAllClinicsSuccess;

  const factory OwnerClinicsState.getAllClinicsFailure(String message) =
      GetAllClinicsFailure;
  // search clinics
  const factory OwnerClinicsState.searchClinicsLoading() = SearchClinicsLoading;
  const factory OwnerClinicsState.searchClinicsSuccess(
      GetAllClinicsResponse getAllClinicsResponse) = SearchClinicsSuccess;

  const factory OwnerClinicsState.searchClinicsFailure(String message) =
      SearchClinicsFailure;
}
