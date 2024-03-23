part of 'tasbeeh_cubit.dart';

@immutable
abstract class TasbeehState {}

class TasbeehInitial extends TasbeehState {}

class TasbeehIncrement extends TasbeehState {}

class TasbeehLastResult extends TasbeehState {
  final dynamic tasbeehCounter;

  TasbeehLastResult({required this.tasbeehCounter});
}

class TasbeehDecrement extends TasbeehState {}

class TasbeehReset extends TasbeehState {}
