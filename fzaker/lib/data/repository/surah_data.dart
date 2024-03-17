import 'dart:developer';

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import '../model/surah_model.dart';

class SurahRepository {
  static Future<List<SurahModel>> getSurahData() async {
    try {
      String jsonData = await rootBundle.loadString('assets/json/sura.json');

      List<SurahModel> surahData = (jsonDecode(jsonData) as List)
          .map((data) => SurahModel.fromJson(data))
          .toList();

      return surahData;
    } on Exception catch (err) {
      log(err.toString());
      return Future.error(
          "Surah Repo error: ", StackTrace.fromString("this is the trace"));
    }
  }
}
