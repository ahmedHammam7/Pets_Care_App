import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pets_care_app/features/store/store/data/models/store_info_response.dart';
import 'package:pets_care_app/features/store/store/data/repos/store_repos.dart';

part 'store_store_state.dart';
part 'store_store_cubit.freezed.dart';

class StoreStoreCubit extends Cubit<StoreStoreState> {
  StoreStoreCubit(this._storeRepo) : super(const StoreStoreState.initial());
  final StoreRepos _storeRepo;
  Future<void> loadStoreProfile() async {
    emit(const StoreStoreState.loading());

    final result = await _storeRepo.getStoreProfile();
    result.when(
      success: (response) {
        emit(StoreStoreState.success(response));
      },
      failure: (message) {
        emit(StoreStoreState.failure(message.getAllErrorMessages()));
      },
    );
  }
}
