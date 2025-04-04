import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pets_care_app/features/clinics/doctor/data/models/clinic_response.dart';
import 'package:pets_care_app/features/clinics/doctor/data/models/doctor_profile_response.dart';
import 'package:pets_care_app/features/clinics/doctor/data/repos/doctor_clinic_repo.dart';

part 'doctor_clinic_state.dart';
part 'doctor_clinic_cubit.freezed.dart';

class DoctorClinicCubit extends Cubit<DoctorClinicState> {
  DoctorClinicCubit(this.doctorClinicRepo)
      : super(const DoctorClinicState.initial());
  final DoctorClinicRepo doctorClinicRepo;
  //formkey
  final formKey = GlobalKey<FormState>();
  //controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController specializationController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController licenseNumberController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController workingHoursController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController medicalSyndicateCodeController =
      TextEditingController();

  Future<void> loadDoctorProfile() async {
    emit(const DoctorClinicState.profileLoading());
    final result = await doctorClinicRepo.getDoctorProfile();
    result.when(
      success: (response) {
        nameController.text = response.user.name;
        emailController.text = response.user.email;
        specializationController.text = response.user.doctor.specialization;
        phoneController.text = response.user.phone.toString();
        licenseNumberController.text =
            response.user.doctor.licenseNumber.toString();
        experienceController.text =
            response.user.doctor.experienceYears.toString();
        workingHoursController.text =
            response.user.doctor.workingTime.toString();
        addressController.text = response.user.doctor.address;
        medicalSyndicateCodeController.text =
            response.user.doctor.medicalSyndicateCode.toString();
        priceController.text = response.user.doctor.price.toString();
        emit(DoctorClinicState.profileSuccess(response));
      },
      failure: (message) {
        emit(DoctorClinicState.profileError(message.getAllErrorMessages()));
      },
    );
  }

  Future<void> updateDoctorProfile() async {
    emit(const DoctorClinicState.updateLoading());

    final result = await doctorClinicRepo.updateDoctorProfile({
      "name": nameController.text,
      "email": emailController.text,
      "phone": phoneController.text,
      "address": addressController.text,
      "specialization": specializationController.text,
      "license_number": licenseNumberController.text,
      "experience_years": experienceController.text,
      "working_time": workingHoursController.text,
      "medical_syndicate_code": medicalSyndicateCodeController.text,
      "price": priceController.text
    });
    result.when(
      success: (response) {
        emit(const DoctorClinicState.updateSuccess());
      },
      failure: (message) {
        emit(DoctorClinicState.updateError(message.getAllErrorMessages()));
      },
    );
  }

  Future<void> deleteClinic(String id) async {
    emit(const DoctorClinicState.deleteLoading());
    final result = await doctorClinicRepo.deleteClinic(id);
    result.when(success: (response) {
      emit(const DoctorClinicState.deleteSuccess());
    }, failure: (message) {
      emit(DoctorClinicState.deleteError(message.getAllErrorMessages()));
    });
  }
}
