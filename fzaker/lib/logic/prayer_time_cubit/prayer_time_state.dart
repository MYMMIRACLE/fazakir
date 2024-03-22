part of 'prayer_time_cubit.dart';

@immutable
abstract class PrayerTimeState {}

class PrayerTimeInitial extends PrayerTimeState {}

class PrayerTimeLoading extends PrayerTimeState {}

class PrayerTimeSuccess extends PrayerTimeState {
  final PrayerTime prayerTimeData;

  PrayerTimeSuccess({required this.prayerTimeData});
}

class PrayerTimeFailure extends PrayerTimeState {
  final String errMessage;

  PrayerTimeFailure({required this.errMessage});
}

//! Geolcator
class PrayerTimeLocationSuccess extends PrayerTimeState {}

class PrayerTimeLocationFailure extends PrayerTimeState {
    final String errMessage;

  PrayerTimeLocationFailure({required this.errMessage});
}
