import '../model/prayer_time.dart';
import '../service/prayer_time_api.dart';

class PrayerTimeRepository {
  static Future<PrayerTime> fetchPrayerTimeData(
      {required double latitude, required double longitude}) async {
    try {
      var prayerTimesData =
          await PrayerTimeWebService.fetchPrayerTimes(latitude, longitude);
      // log(prayerTimesData);

      return PrayerTime.fromJson(prayerTimesData as Map<String, dynamic>);
    } catch (err) {
      return Future.error("prayertime repo error: $err",
          StackTrace.fromString("this is the trace"));
    }
  }
}
