import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pets_care_app/features/check/data/models/predict_response.dart';
import 'package:pets_care_app/features/check/data/repos/check_repo.dart';

part 'check_state.dart';
part 'check_cubit.freezed.dart';

class CheckCubit extends Cubit<CheckState> {
  CheckCubit(this._checkRepo) : super(const CheckState.initial());
  final CheckRepo _checkRepo;
  XFile? image;
  Future<void> checkByAi() async {
    emit(const CheckState.loading());
    final body = FormData.fromMap(
      {
        'image': image != null
            ? await MultipartFile.fromFile(
                image!.path,
                filename: "image.jpg",
              )
            : null,
      },
    );
    final result = await _checkRepo.checkByAi(body);
    result.when(success: (data) {
      emit(CheckState.success(data));
    }, failure: (message) {
      emit(CheckState.error(message.getAllErrorMessages()));
    });
  }

  @override
  void onChange(Change<CheckState> change) {
    super.onChange(change);
    print(change);
  }
}
