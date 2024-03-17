import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fazakir/data/model/ayat_model.dart';
import 'package:meta/meta.dart';

import '../../data/repository/quran_data.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit() : super(QuranInitial());
  Future<void> quranVerse() async {
    emit(QuranLoading());
    try {
      List<QuranVerse> quranDataList = await QuranRepository.getQuranVerses();
      emit(QuranSuccess(quranDataList: quranDataList));
    } catch (err) {
      emit(QuranFailure(errMessage: "There was an error!"));
      log(err.toString());
      return Future.error(
          "hadith cubit error: ", StackTrace.fromString("this is the trace"));
    }
  }
}
