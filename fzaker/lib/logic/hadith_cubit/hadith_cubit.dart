import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fazakir/data/repository/hadith_data.dart';
import 'package:meta/meta.dart';
import '../../data/model/hadith_model.dart';

part 'hadith_state.dart';

class HadithCubit extends Cubit<HadithState> {
  HadithCubit() : super(HadithInitial());
  Future<void> getHadithData() async {
    emit(HadithLoading());
    try {
      HadithDataModel hadithData = await HadithRepository.fetchHadithData();
      emit(HadithSuccess(hadithElYoum: hadithData));
    } catch (err) {
      emit(HadithFailure(errMessage: "There was an error!"));
      log(err.toString());
      return Future.error(
          "hadith cubit error: ", StackTrace.fromString("this is the trace"));
    }
  }
}
