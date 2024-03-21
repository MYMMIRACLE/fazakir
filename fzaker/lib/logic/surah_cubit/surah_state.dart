part of 'surah_cubit.dart';

@immutable
abstract class SurahState {}

class SurahInitial extends SurahState {}

class SurahLoading extends SurahState {}

class SurahSuccess extends SurahState {
  final List<SurahModel> suraDataList;

  SurahSuccess({required this.suraDataList});
}

class SurahFailure extends SurahState {
  final String errMessage;

  SurahFailure({required this.errMessage});
}
