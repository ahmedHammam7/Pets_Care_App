import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pets_care_app/core/helper/shared_prefs/shared_prefs.dart';
import 'package:pets_care_app/core/helper/shared_prefs/shared_prefs_constant.dart';
import 'package:pets_care_app/features/store/client/data/models/product_model.dart';
import 'package:pets_care_app/features/store/store/data/models/store_info_response.dart';
import 'package:pets_care_app/features/store/store/data/repos/store_repos.dart';

part 'store_store_state.dart';
part 'store_store_cubit.freezed.dart';

class StoreStoreCubit extends Cubit<StoreStoreState> {
  StoreStoreCubit(this._storeRepo) : super(const StoreStoreState.initial());
  final StoreStoreRepos _storeRepo;
  //update info controlles
  TextEditingController storeNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController hotLineController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController whatsappPhoneController = TextEditingController();
  //add product controllers
  TextEditingController descriptionController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  XFile? image;

// form key
  final formKey = GlobalKey<FormState>();

  Future<void> loadStoreProfile() async {
    emit(const StoreStoreState.loading());

    final result = await _storeRepo.getStoreProfile();
    result.when(
      success: (response) {
        storeNameController.text = response.user.store.storeName;
        emailController.text = response.user.email;
        hotLineController.text = response.user.store.hotLine.toString();
        addressController.text = response.user.store.address;
        whatsappPhoneController.text = response.user.store.whatsappPhone;
        emit(StoreStoreState.success(response));
      },
      failure: (message) {
        emit(StoreStoreState.failure(message.getAllErrorMessages()));
      },
    );
  }

  Future<void> updateStoreProfile() async {
    emit(const StoreStoreState.updateLoading());

    final result = await _storeRepo.updateStoreProfile({
      "store_name": storeNameController.text,
      "email": emailController.text,
      "hot_line": hotLineController.text,
      "address": addressController.text,
      "whatsapp_phone": whatsappPhoneController.text,
    });
    result.when(
      success: (response) {
        emit(const StoreStoreState.updateSuccess());
      },
      failure: (message) {
        emit(StoreStoreState.updateFailure(message.getAllErrorMessages()));
      },
    );
  }

  Future<void> addProductt() async {
    if (nameController.text.isEmpty ||
        categoryController.text.isEmpty ||
        typeController.text.isEmpty ||
        priceController.text.isEmpty ||
        descriptionController.text.isEmpty) {
      emit(const StoreStoreState.addProductFailure(
          "All required fields must be filled"));
      return;
    }
    final price = double.tryParse(priceController.text);
    if (price == null || price <= 0) {
      emit(const StoreStoreState.addProductFailure("Invalid price"));
      return;
    }
    emit(const StoreStoreState.addProductLoading());
    final formData = FormData.fromMap({
      "name": nameController.text.trim(),
      "category": categoryController.text.trim(),
      "food_type": typeController.text.trim(),
      "price": price,
      "description": descriptionController.text.trim().isNotEmpty
          ? descriptionController.text.trim()
          : null,
      "image": image != null
          ? await MultipartFile.fromFile(
              image!.path,
              filename: "image.jpg",
            )
          : null,
    });

    final result = await _storeRepo.addProduct(formData);
    result.when(
      success: (response) {
        emit(const StoreStoreState.addProductSuccess());
      },
      failure: (message) {
        emit(StoreStoreState.addProductFailure(message.getAllErrorMessages()));
      },
    );
  }

  Future<void> loadAllProducts() async {
    emit(const StoreStoreState.allProductsLoading());

    final result = await _storeRepo.getAllProducts();
    result.when(
      success: (response) {
        emit(StoreStoreState.allProductsSuccess(response));
      },
      failure: (message) {
        emit(StoreStoreState.allProductsFailure(message.getAllErrorMessages()));
      },
    );
  }

  Future<void> logout() async {
    await SharedPrefHelper.removeSecuredData(SharedPrefsConstant.token);
    await SharedPrefHelper.removeData(SharedPrefsConstant.type);
    emit(const StoreStoreState.logout());
  }

  Future<void> deleteProduct(
    String id,
  ) async {
    emit(const StoreStoreState.deleteProductLoading());
    final result = await _storeRepo.deleteProduct(id);
    result.when(success: (response) {
      emit(const StoreStoreState.deleteProductSuccess());
    }, failure: (message) {
      emit(StoreStoreState.deleteProductFailure(message.getAllErrorMessages()));
    });
  }

  Future<void> updateProduct(String id) async {
    final price = double.tryParse(priceController.text);
    if (price == null || price <= 0) {
      emit(const StoreStoreState.addProductFailure("Invalid price"));
      return;
    }
    emit(const StoreStoreState.updateProductLoading());
    final formData = FormData.fromMap({
      "name": nameController.text.trim(),
      "category": categoryController.text.trim(),
      "food_type": typeController.text.trim(),
      "price": price,
      "description": descriptionController.text.trim(),
      "image": image != null
          ? await MultipartFile.fromFile(
              image!.path,
              filename: "image.jpg",
            )
          : null,
    });
    final result = await _storeRepo.updateProduct(id, formData);
    result.when(success: (response) {
      emit(const StoreStoreState.updateProductSuccess());
    }, failure: (message) {
      emit(StoreStoreState.updateProductFailure(message.getAllErrorMessages()));
    });
  }

  @override
  void onChange(Change<StoreStoreState> change) {
    print(change);
    super.onChange(change);
  }
}
