import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:pets_care_app/features/store/client/data/models/product_model.dart';
import 'package:pets_care_app/features/store/client/data/models/search_items_response.dart';
import 'package:pets_care_app/features/store/client/data/models/specific_store_item.dart';
import 'package:pets_care_app/features/store/client/data/models/store_response.dart';
import 'package:pets_care_app/features/store/client/data/repos/store_repo.dart';

part 'store_state.dart';
part 'store_cubit.freezed.dart';

class StoreCubit extends Cubit<StoreState> {
  StoreCubit(this._storeRepo) : super(const StoreState.initial());
  final StoreRepo _storeRepo;
  Future<void> getProducts() async {
    emit(const StoreState.loading());
    final result = await _storeRepo.getAllProducts();
    result.when(
      success: (response) {
        emit(StoreState.success(response));
      },
      failure: (message) {
        emit(StoreState.error(message.getAllErrorMessages()));
      },
    );
  }

  Future<void> getAllStores() async {
    emit(const StoreState.allStoresLoading());
    final result = await _storeRepo.getAllStores();
    result.when(
      success: (response) {
        emit(StoreState.allStoresSuccess(response));
      },
      failure: (message) {
        emit(StoreState.allStoresError(message.getAllErrorMessages()));
      },
    );
  }

  Future<void> searchStore(String query) async {
    emit(const StoreState.searchStoresLoading());
    final result = await _storeRepo.searchStore(query);
    result.when(
      success: (response) {
        emit(StoreState.searchStoresSuccess(response));
      },
      failure: (message) {
        emit(StoreState.searchStoresError(message.getAllErrorMessages()));
      },
    );
  }

  Future<void> getSpecificStore(String id) async {
    emit(const StoreState.specificStoreLoading());
    final result = await _storeRepo.getSpecificStore(id);
    result.when(
      success: (response) async {
        emit(StoreState.specificStoreSuccess(response));
      },
      failure: (message) {
        emit(StoreState.specificStoreError(message.getAllErrorMessages()));
      },
    );
  }

  Future<void> searchItems(String query) async {
    emit(const StoreState.searchItemsLoading());
    final result = await _storeRepo.searchItems(query);
    result.when(
      success: (response) {
        emit(StoreState.searchItemsSuccess(response));
      },
      failure: (message) {
        emit(StoreState.searchItemsError(message.getAllErrorMessages()));
      },
    );
  }

  @override
  void onChange(Change<StoreState> change) {
    if (kDebugMode) {
      print(change);
    }
    super.onChange(change);
  }
}
