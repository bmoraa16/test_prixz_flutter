import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static final SharedPreferencesManager _instance =
      SharedPreferencesManager._internal();

  factory SharedPreferencesManager() {
    return _instance;
  }

  SharedPreferencesManager._internal() {
    SharedPreferences.getInstance().then((value) => preferences = value);
  }

  late SharedPreferences preferences;

  static Future<void> removeKey(String key) async {
    await _instance.preferences.remove(key);
  }

  static Future<void> setData(bool value) async {
    await _instance.preferences.setBool('dataAvailable', value);
  }

  static Future<bool> getData() async {
    return _instance.preferences.getBool("dataAvailable") ?? false;
  }
}
