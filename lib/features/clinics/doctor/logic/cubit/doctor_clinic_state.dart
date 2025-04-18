part of 'doctor_clinic_cubit.dart';

@freezed
class DoctorClinicState with _$DoctorClinicState {
  const factory DoctorClinicState.initial() = _Initial;
  const factory DoctorClinicState.profileLoading() = loadDoctorProfileLoading;
  const factory DoctorClinicState.profileSuccess(
    DoctorProfileResponse data,
  ) = loadDoctorProfileSuccess;
  const factory DoctorClinicState.profileError(String message) =
      loadDoctorProfileError;
  //update profile
  const factory DoctorClinicState.updateLoading() = updateDoctorProfileLoading;
  const factory DoctorClinicState.updateSuccess() = updateDoctorProfileSuccess;
  const factory DoctorClinicState.updateError(String message) =
      updateDoctorProfileError;
  // delete Clinic
  const factory DoctorClinicState.deleteLoading() = deleteDoctorClinicLoading;
  const factory DoctorClinicState.deleteSuccess() = deleteDoctorClinicSuccess;
  const factory DoctorClinicState.deleteError(String message) =
      deleteDoctorClinicError;
  // get clinics
  const factory DoctorClinicState.clinicsLoading() = getDoctorClinicsLoading;
  const factory DoctorClinicState.clinicsSuccess(List<ClinicResponse> data) =
      getDoctorClinicsSucess;
  const factory DoctorClinicState.clinicsError(String message) =
      getDoctorClinicsError;
//logout

  const factory DoctorClinicState.logoutSuccess() = DoctorlogoutSuccess;
  // get all appointments
  const factory DoctorClinicState.appointmentsLoading() =
      getDoctorAppointmentsLoading;
  const factory DoctorClinicState.appointmentsSuccess(
      AppoinmentDocResponse data) = getDoctorAppointmentsSucess;
  const factory DoctorClinicState.appointmentsError(String message) =
      getDoctorAppointmentsError;
  // add clinic
  const factory DoctorClinicState.addClinicLoading() = addDoctorClinicLoading;
  const factory DoctorClinicState.addClinicSuccess() = addDoctorClinicSuccess;
  const factory DoctorClinicState.addClinicError(String message) =
      addDoctorClinicError;
// update clinic
  const factory DoctorClinicState.updateClinicLoading() =
      updateDoctorClinicLoading;
  const factory DoctorClinicState.updateClinicSuccess() =
      updateDoctorClinicSuccess;
  const factory DoctorClinicState.updateClinicError(String message) =
      updateDoctorClinicError;
}
