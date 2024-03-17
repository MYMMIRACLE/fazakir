part of 'hadith_cubit.dart';

@immutable
abstract class HadithState {}

class HadithInitial extends HadithState {}

class HadithLoading extends HadithState {}

class HadithSuccess extends HadithState {
  final HadithDataModel hadithElYoum;

  HadithSuccess({required this.hadithElYoum});
}

class HadithFailure extends HadithState {
  final String errMessage;

  HadithFailure({required this.errMessage});
}
