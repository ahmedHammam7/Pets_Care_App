import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pets_care_app/core/helper/shared_prefs/shared_prefs.dart';
import 'package:pets_care_app/core/helper/shared_prefs/shared_prefs_constant.dart';
import 'package:pets_care_app/features/clinics/doctor/data/models/appoinment_doc_response.dart';
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
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController medicalSyndicateCodeController =
      TextEditingController();
  TextEditingController dayController = TextEditingController();
  TextEditingController appointmentDateController = TextEditingController();
  XFile? imageFile;

  Future<void> loadDoctorProfile() async {
    emit(const DoctorClinicState.profileLoading());
    final result = await doctorClinicRepo.getDoctorProfile();
    result.when(
      success: (response) async {
        nameController.text = response.user.name;
        emailController.text = response.user.email;
        specializationController.text = response.user.doctor.specialization;
        phoneController.text = response.user.phone.toString();
        licenseNumberController.text =
            response.user.doctor.licenseNumber.toString();
        experienceController.text =
            response.user.doctor.experienceYears.toString();
        startTimeController.text = response.user.doctor.workingTime.toString();
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
      "working_time": startTimeController.text,
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

  Future<void> getAllClinics() async {
    emit(const DoctorClinicState.clinicsLoading());
    final result = await doctorClinicRepo.getAllClinics();
    result.when(success: (response) {
      emit(DoctorClinicState.clinicsSuccess(response));
    }, failure: (message) {
      emit(DoctorClinicState.clinicsError(message.getAllErrorMessages()));
    });
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

  Future<void> getAllDoctorAppointments() async {
    emit(const DoctorClinicState.appointmentsLoading());
    final result = await doctorClinicRepo.getAllDoctorAppointments();
    result.when(success: (response) {
      emit(DoctorClinicState.appointmentsSuccess(response));
    }, failure: (message) {
      emit(DoctorClinicState.appointmentsError(message.getAllErrorMessages()));
    });
  }

  Future<void> logout() async {
    await SharedPrefHelper.removeSecuredData(SharedPrefsConstant.token);
    await SharedPrefHelper.removeData(SharedPrefsConstant.type);
    await SharedPrefHelper.removeData(SharedPrefsConstant.doctorId);
    emit(const DoctorClinicState.logoutSuccess());
  }

  Future<void> addClinic() async {
    emit(const DoctorClinicState.addClinicLoading());
    final formData = FormData.fromMap({
      "day": dayController.text,
      "price": priceController.text,
      "address": addressController.text,
      "time": startTimeController.text,
      "end_time": endTimeController.text,
      "appointment_date": appointmentDateController.text,
      "photo": imageFile != null
          ? await MultipartFile.fromFile(
              imageFile!.path,
              filename: "image.jpg",
            )
          : null,
    });
    final result = await doctorClinicRepo.addClinic(formData);
    result.when(success: (response) {
      emit(const DoctorClinicState.addClinicSuccess());
    }, failure: (message) {
      emit(DoctorClinicState.addClinicError(message.getAllErrorMessages()));
    });
  }

  Future<void> updateClinic(String id) async {
    final price = double.tryParse(priceController.text);
    if (price == null || price <= 0) {
      emit(const DoctorClinicState.updateClinicError("Invalid price"));
      return;
    }
    emit(const DoctorClinicState.updateClinicLoading());
    final formData = FormData.fromMap({
      "day": dayController.text.trim(),
      "address": addressController.text.trim(),
      "end_time": endTimeController.text.trim(),
      "price": price,
      "time": startTimeController.text.trim(),
      "image": imageFile != null
          ? await MultipartFile.fromFile(
              imageFile!.path,
              filename: "image.jpg",
            )
          : null,
    });
    final result = await doctorClinicRepo.updateClinic(id, formData);
    result.when(success: (response) {
      emit(const DoctorClinicState.updateClinicSuccess());
    }, failure: (message) {
      emit(DoctorClinicState.updateClinicError(message.getAllErrorMessages()));
    });
  }
}
