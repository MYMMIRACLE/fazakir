part of 'quran_cubit.dart';

@immutable
abstract class QuranState {}

class QuranInitial extends QuranState {}

class QuranLoading extends QuranState {}

class QuranSuccess extends QuranState {
  final List<QuranVerse> quranDataList;

  QuranSuccess({required this.quranDataList});
}

class QuranFailure extends QuranState {
  final String errMessage;

  QuranFailure({required this.errMessage});
}
