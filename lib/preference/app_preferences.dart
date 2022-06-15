import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static late SharedPreferences _prefs;

  AppPreferences._();

  static Future<SharedPreferences?> getInstance() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  ///keys
  static String userName = 'userName';

  /// sets method
  static Future<bool?> setString(String key, String value) async {
    if (_prefs == null) return null;
    return await _prefs.setString(key, value);
  }

  /// gets method
  static String? getString(String key) {
    if (_prefs == null) return null;
    return _prefs.getString(key);
  }

  ///delete methods
  static Future<bool?> remove(String key) async {
    if (_prefs == null) return null;
    return await _prefs.remove(key);
  }

  /// clear Pref
  static Future<bool?> clear() async {
    if (_prefs == null) return null;
    return await _prefs.clear();
  }

  /// Pref contains key
  static bool containsKey(String key) {
    return _prefs.containsKey(key);
  }
}
