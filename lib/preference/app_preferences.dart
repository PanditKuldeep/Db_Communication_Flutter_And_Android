import 'package:shared_preferences/shared_preferences.dart';
import 'package:synchronized/synchronized.dart';

class AppPreferences {
  static late AppPreferences _appPreferences;
  static late SharedPreferences _prefs;
  static final Lock _lock = Lock();

  AppPreferences._();

  static Future<AppPreferences?> getInstance() async {
    await _lock.synchronized(
      () async {
        var singleton = AppPreferences._();
        await singleton._init();
        _appPreferences = singleton;
      },
    );
    return _appPreferences;
  }

  Future _init() async {
    SharedPreferences.setMockInitialValues({});
    _prefs = await SharedPreferences.getInstance();
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
