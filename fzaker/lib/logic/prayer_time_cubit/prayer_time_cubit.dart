import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import '../../core/helper/location_helper.dart';
import '../../data/model/prayer_time.dart';
import '../../data/repository/prayer_time.dart';
part 'prayer_time_state.dart';

class PrayerTimeCubit extends Cubit<PrayerTimeState> {
  PrayerTimeCubit() : super(PrayerTimeInitial());

  static Position? position;
  Future<void> getCurrentLocation() async {
    try {
      await LocationHelper.determineCurrentPosition();
      position = await Geolocator.getCurrentPosition().whenComplete(() {
        emit(PrayerTimeLocationSuccess());
      });
      await getPrayerTime(
          latitude: position!.latitude, longitude: position!.longitude);
    } on Exception catch (err) {
      log(err.toString());
      emit(PrayerTimeLocationFailure(errMessage: "There was an error!"));
    }
  }

  Future<void> getPrayerTime(
      {required double latitude, required double longitude}) async {
    emit(PrayerTimeLoading());
    try {
      PrayerTime prayerTimeData = await PrayerTimeRepository.fetchPrayerTimeData(
          latitude: latitude, longitude: longitude);

      emit(PrayerTimeSuccess(prayerTimeData: prayerTimeData));
    } on Exception catch (err) {
      emit(PrayerTimeFailure(errMessage: "There was an error!"));
      log(err.toString());
      return Future.error("PrayerTime cubit error: ",
          StackTrace.fromString("this is the trace"));
    }
  }
}
