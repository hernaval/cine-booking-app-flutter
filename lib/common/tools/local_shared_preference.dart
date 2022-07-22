import 'package:shared_preferences/shared_preferences.dart';
class LocalSharedPreference {
  static Future<SharedPreferences> getInstance () async {
    return await SharedPreferences.getInstance();
  }
}