import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pets_care_app/features/add_pets/data/models/activity_response.dart';
import 'package:pets_care_app/features/add_pets/data/models/pet_response.dart';
import 'package:pets_care_app/features/add_pets/data/repos/pets_repo.dart';
import 'package:pets_care_app/features/locations/data/models/location_response.dart';

part 'pets_state.dart';
part 'pets_cubit.freezed.dart';

class PetsCubit extends Cubit<PetsState> {
  PetsCubit(this._petsRepo) : super(const PetsState.initial());
  final PetsRepo _petsRepo;
//controllers
  TextEditingController petNameController = TextEditingController();
  TextEditingController petTypeController = TextEditingController();
  TextEditingController petAgeController = TextEditingController();
  TextEditingController petGenderController = TextEditingController();
  TextEditingController petColorController = TextEditingController();
  TextEditingController petHeightController = TextEditingController();
  TextEditingController petWeightController = TextEditingController();
  TextEditingController petVaccineTimeController = TextEditingController();
  TextEditingController deviceIdController = TextEditingController();
  XFile? photo;
  // form key
  final formKey = GlobalKey<FormState>();
  final addPetFormKey = GlobalKey<FormState>();

  Future<void> getAllPets() async {
    emit(const PetsState.getAllPetsLoading());
    final result = await _petsRepo.getAllPets();
    result.when(success: (response) {
      emit(PetsState.getAllPetsSuccess(response));
    }, failure: (message) {
      emit(PetsState.getAllPetsError(message.getAllErrorMessages()));
    });
  }

  Future<void> addPet() async {
    emit(const PetsState.addPetLoading());
    final formData = FormData.fromMap({
      'pet_name': petNameController.text,
      'pet_type': petTypeController.text,
      'age': petAgeController.text,
      'gender': petGenderController.text,
      'color': petColorController.text,
      'height': petHeightController.text,
      'weight': petWeightController.text,
      'vaccination_time': petVaccineTimeController.text,
      'device_id': deviceIdController.text ?? "",
      'photo': photo != null
          ? await MultipartFile.fromFile(
              photo!.path,
              filename: "image.jpg",
            )
          : null,
    });
    final result = await _petsRepo.addPet(formData);
    result.when(success: (response) {
      emit(const PetsState.addPetSuccess());
    }, failure: (message) {
      emit(PetsState.addPetError(message.getAllErrorMessages()));
    });
  }

  Future<void> deletePet(String id) async {
    emit(const PetsState.deletePetLoading());
    final result = await _petsRepo.deletePet(id);
    result.when(success: (response) {
      emit(const PetsState.deletePetSuccess());
    }, failure: (message) {
      emit(PetsState.deletePetError(message.getAllErrorMessages()));
    });
  }

  Future<void> updatePet(String id) async {
    emit(const PetsState.updatePetLoading());
    final FormData formData = FormData.fromMap({
      'pet_name': petNameController.text,
      'pet_type': petTypeController.text,
      'age': petAgeController.text,
      'gender': petGenderController.text,
      'color': petColorController.text,
      'height': petHeightController.text,
      'weight': petWeightController.text,
      'device_id': deviceIdController.text ?? "",
      'vaccination_time': petVaccineTimeController.text,
      'photo': photo != null
          ? await MultipartFile.fromFile(
              photo!.path,
              filename: "image.jpg",
            )
          : null,
    });
    final result = await _petsRepo.updatePet(id, formData);
    result.when(success: (response) {
      emit(const PetsState.updatePetSuccess());
    }, failure: (message) {
      emit(PetsState.updatePetError(message.getAllErrorMessages()));
    });
  }

  Future<void> getPetActivity(String id) async {
    emit(const PetsState.getPetActivityLoading());
    final result = await _petsRepo.getPetActivity(id);
    result.when(success: (response) {
      emit(PetsState.getPetActivitySuccess(response));
    }, failure: (message) {
      emit(PetsState.getPetActivityError(message.getAllErrorMessages()));
    });
  }

  Future<void> getPetLocation(String id) async {
    emit(const PetsState.getPetLocationLoading());
    final result = await _petsRepo.getPetLocation(id);
    result.when(success: (response) {
      emit(PetsState.getPetLocationSuccess(response));
    }, failure: (message) {
      emit(PetsState.getPetLocationError(message.getAllErrorMessages()));
    });
  }
}
