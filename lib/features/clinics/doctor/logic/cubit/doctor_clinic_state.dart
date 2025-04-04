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
}
