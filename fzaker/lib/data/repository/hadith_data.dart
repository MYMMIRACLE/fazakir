import 'dart:developer';

import '../model/hadith_model.dart';
import '../service/hadith_api.dart';

class HadithRepository {
  static Future<HadithDataModel> fetchHadithData() async {
    try {
      final hadithData = await HadithWebService.fetchHadithData();
      return HadithDataModel.fromJson(hadithData);
    } catch (err) {
      log(err.toString());
      return Future.error(
          "hadith repo error: ", StackTrace.fromString("this is the trace"));
    }
  }
}
