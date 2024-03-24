import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fazakir/data/model/prayer_time.dart';

class PrayerTimeWebService {
  static Dio dio = Dio();

  static Future<Map<String, dynamic>> fetchPrayerTimes(
      dynamic latitude, dynamic longitude) async {
    try {
      Response response = await dio
          .get('https://api.aladhan.com/v1/calendar/2024/3?', queryParameters: {
        'latitude': latitude,
        'longitude': longitude,
      });
      log('$latitude || $longitude');

      log(response.data.toString());
      log(response.statusCode.toString());

      return response.data;
    } on DioException {
      return Future.error("prayertime web service method error:",
          StackTrace.fromString("this is the trace"));
    } catch (err) {
      log('Dio Method err:$err');
      return Future.error("prayertime web service method error $err");
    }
  }
}
