import '../model/prayer_time.dart';
import '../service/prayer_time_api.dart';

class PrayerTimeRepository {
  static Future<PrayerTime> fetchPrayerTimeData(
      {required dynamic latitude, required dynamic longitude}) async {
    try {
      var prayerTimesData =
          await PrayerTimeWebService.fetchPrayerTimes(latitude, longitude);
      return PrayerTime.fromJson(prayerTimesData);
    } catch (err) {
      return Future.error("prayertime repo error: $err",
          StackTrace.fromString("this is the trace"));
    }
  }
}
