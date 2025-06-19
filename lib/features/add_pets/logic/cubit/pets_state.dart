part of 'pets_cubit.dart';

@freezed
class PetsState with _$PetsState {
  const factory PetsState.initial() = _Initial;
  // get all pets
  const factory PetsState.getAllPetsLoading() = GetAllPetsLoading;
  const factory PetsState.getAllPetsSuccess(List<PetResponse> pets) =
      GetAllPetsSuccess;
  const factory PetsState.getAllPetsError(String message) = GetAllPetsError;
  // add pet
  const factory PetsState.addPetLoading() = AddPetLoading;
  const factory PetsState.addPetSuccess() = AddPetSuccess;
  const factory PetsState.addPetError(String message) = AddPetError;
  // delete pet
  const factory PetsState.deletePetLoading() = DeletePetLoading;
  const factory PetsState.deletePetSuccess() = DeletePetSuccess;
  const factory PetsState.deletePetError(String message) = DeletePetError;
  // update pet
  const factory PetsState.updatePetLoading() = UpdatePetLoading;
  const factory PetsState.updatePetSuccess() = UpdatePetSuccess;
  const factory PetsState.updatePetError(String message) = UpdatePetError;
  // get pet activity
  const factory PetsState.getPetActivityLoading() = GetPetActivityLoading;
  const factory PetsState.getPetActivitySuccess(ActivityResponse activity) =
      GetPetActivitySuccess;
  const factory PetsState.getPetActivityError(String message) =
      GetPetActivityError;
// get pet location
  const factory PetsState.getPetLocationLoading() = GetPetLocationLoading;
  const factory PetsState.getPetLocationSuccess(LocationResponse location) =
      GetPetLocationSuccess;
  const factory PetsState.getPetLocationError(String message) =
      GetPetLocationError;
}
