import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fazakir/data/model/ayat_model.dart';
import 'package:meta/meta.dart';

import '../../data/repository/quran_data.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit() : super(QuranInitial());
  Future<void> quranVerse({required String jsonName}) async {
    emit(QuranLoading());
    try {
      log("cubit start");
      List<QuranVerse> quranDataList =
          await QuranRepository.getQuranVerses(jsonName: jsonName);
      emit(QuranSuccess(quranDataList: quranDataList));
      // for (var element in quranDataList) {
      //   log(element.sura);
      //   log(element.ayat);
      // }
    } catch (err) {
      emit(QuranFailure(errMessage: "There was an error!"));
      log(err.toString());
      return Future.error(
          "quran cubit error: ", StackTrace.fromString("this is the trace"));
    }
  }
}
