import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pets_care_app/features/store/client/data/models/product_model.dart';
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
        print(response[0].name);
        emit(StoreState.success(response));
      },
      failure: (message) {
        emit(StoreState.error(message.getAllErrorMessages()));
      },
    );
  }

  @override
  void onChange(Change<StoreState> change) {
    print(change);
    super.onChange(change);
  }
}
