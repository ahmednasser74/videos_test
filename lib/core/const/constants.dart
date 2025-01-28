import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  const Constants._();
  static const String appName = 'Flutter Starter';
  static String baseUrl = dotenv.env['BASE_URL'] ?? '';
  static const int limit = 10;
  static String hiveVideosName = dotenv.env['HIVE_VIDEO_NAME'] ?? '';
}
