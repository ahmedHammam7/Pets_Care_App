import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pets_care_app/features/auth/register/data/repos/register_repo.dart';
part 'register_state.dart';
part 'register_cubit.freezed.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerRepo) : super(const RegisterState.initial());
  final RegisterRepo registerRepo;
  //controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController specializationController = TextEditingController();
  TextEditingController licenseNumberController = TextEditingController();
  TextEditingController experienceYearsController = TextEditingController();
  TextEditingController workingTimeController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController medicalSyndicateCodeController =
      TextEditingController();
  TextEditingController storeNameController = TextEditingController();
  TextEditingController hotLineController = TextEditingController();
  TextEditingController whatsappPhoneController = TextEditingController();

  //formKey
  final formKey = GlobalKey<FormState>();

  Future<void> register() async {
    emit(const RegisterState.loading());
    final result = await registerRepo.register(
      {
        "name": nameController.text,
        "email": emailController.text,
        "password": passwordController.text,
        "phone": phoneController.text,
        "type": "owner",
      },
    );
    result.when(
      success: (response) {
        emit(RegisterState.success(response));
      },
      failure: (message) {
        emit(RegisterState.error(message.getAllErrorMessages()));
      },
    );
  }

  Future<void> registerDoctor() async {
    emit(const RegisterState.registerLoadingDoctor());
    final result = await registerRepo.register(
      {
        "name": nameController.text,
        "email": emailController.text,
        "password": passwordController.text,
        "phone": phoneController.text,
        "type": "doctor",
        "specialization": specializationController.text,
        "license_number": licenseNumberController.text,
        "experience_years": experienceYearsController.text,
        "working_time": workingTimeController.text,
        "address": addressController.text,
        "price": priceController.text,
        "medical_syndicate_code": medicalSyndicateCodeController.text
      },
    );
    result.when(
      success: (response) {
        emit(RegisterState.registerSuccessDoctor(response));
      },
      failure: (message) {
        emit(RegisterState.registerErrorDoctor(message.getAllErrorMessages()));
      },
    );
  }

  Future<void> registerStore() async {
    emit(const RegisterState.registerLoadingStore());
    final result = await registerRepo.register(
      {
        "name": nameController.text,
        "email": emailController.text,
        "password": passwordController.text,
        "phone": phoneController.text,
        "type": "store",
        "store_name": storeNameController.text,
        "hot_line": hotLineController.text,
        "whatsapp_phone": whatsappPhoneController.text,
        "address": addressController.text
      },
    );
    result.when(
      success: (response) {
        emit(RegisterState.registerSuccessStore(response));
      },
      failure: (message) {
        emit(RegisterState.registerErrorStore(message.getAllErrorMessages()));
      },
    );
  }
}
