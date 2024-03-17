import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fazakir/core/constant/string.dart';

class HadithWebService {
  static Dio dio = Dio();

  static Future fetchHadithData() async {
    try {
      Response response = await dio.get(MyApiUrl.hadithApiUrl);

      log(response.data['hadith']['text'].toString());
      log(response.statusCode.toString());
      return response.data;
    } on DioException {
      return Future.error(
          "hadith method error: ", StackTrace.fromString("this is the trace"));
    } catch (err) {
      log('Dio Method err:$err');
    }
  }
}
