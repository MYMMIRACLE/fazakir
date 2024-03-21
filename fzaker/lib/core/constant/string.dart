import 'package:flutter_dotenv/flutter_dotenv.dart';

class MyApiUrl {
  static String hadithApiUrl = dotenv.env['hadithApiUrl']!;
}

class MyRoutes {}

class MyImages {}
