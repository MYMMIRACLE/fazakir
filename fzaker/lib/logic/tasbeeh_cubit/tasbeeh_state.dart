part of 'tasbeeh_cubit.dart';

@immutable
abstract class TasbeehState {}

class TasbeehInitial extends TasbeehState {}

class TasbeehIncrement extends TasbeehState {}

class TasbeehDecrement extends TasbeehState {}

class TasbeehReset extends TasbeehState {}
