import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/model/surah_model.dart';
import '../../data/repository/surah_data.dart';

part 'surah_state.dart';

class SurahCubit extends Cubit<SurahState> {
  SurahCubit() : super(SurahInitial());
  Future<void> surahData() async {
    emit(SurahLoading());
    try {
      List<SurahModel> surahDataList = await SurahRepository.getSurahData();
      emit(SurahSuccess(suraDataList: surahDataList));
    } catch (err) {
      emit(SurahFailure(errMessage: "There was an error!"));
      log(err.toString());
      return Future.error(
          "Surah cubit error: ", StackTrace.fromString("this is the trace"));
    }
  }
}
