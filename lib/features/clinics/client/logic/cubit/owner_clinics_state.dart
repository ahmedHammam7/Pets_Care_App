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
  // create appointment
  const factory OwnerClinicsState.createAppointmentLoading() =
      CreateAppointmentLoading;
  const factory OwnerClinicsState.createAppointmentSuccess() =
      CreateAppointmentSuccess;
  const factory OwnerClinicsState.createAppointmentFailure(String message) =
      CreateAppointmentFailure;
// get all appointments
  const factory OwnerClinicsState.getAllAppointmentsLoading() =
      GetAllAppointmentsLoading;
  const factory OwnerClinicsState.getAllAppointmentsSuccess(
      List<AppoinmentsOwnerResponse> appoinments) = GetAllAppointmentsSuccess;

  const factory OwnerClinicsState.getAllAppointmentsFailure(String message) =
      GetAllAppointmentsFailure;
  // delete appointment
  const factory OwnerClinicsState.deleteAppointmentLoading() =
      DeleteAppointmentLoading;
  const factory OwnerClinicsState.deleteAppointmentSuccess() =
      DeleteAppointmentSuccess;
  const factory OwnerClinicsState.deleteAppointmentFailure(String message) =
      DeleteAppointmentFailure;
  // update appointment
  const factory OwnerClinicsState.updateAppointmentLoading() =
      UpdateAppointmentLoading;
  const factory OwnerClinicsState.updateAppointmentSuccess() =
      UpdateAppointmentSuccess;
  const factory OwnerClinicsState.updateAppointmentFailure(String message) =
      UpdateAppointmentFailure;
}
