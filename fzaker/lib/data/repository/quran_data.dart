import 'dart:developer';

import '../model/ayat_model.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class QuranRepository {
  static Future<List<QuranVerse>> getQuranVerses() async {
    try {
      String jsonData =
          await rootBundle.loadString('assets/json/ayats_ar.json');

      List<QuranVerse> verses = (jsonDecode(jsonData) as List)
          .map((data) => QuranVerse.fromJson(data))
          .toList();

      return verses;
    } on Exception catch (err) {
      log(err.toString());
      return Future.error(
          "quran Repo error: ", StackTrace.fromString("this is the trace"));
    }
  }
}
