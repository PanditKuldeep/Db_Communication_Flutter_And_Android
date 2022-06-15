import 'package:android_native_flutter_db/preference/app_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AccessPreference extends StatelessWidget {
  const AccessPreference({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              AppPreferences.setString(
                  AppPreferences.userName, "Kuldeep Pandit");
            },
            child: const Text('Save in Flutter Preference'),
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {
              flutterGetPrefData().then(
                (value) {
                  print("FROM_ANDROID_IN_FLUTTER : $value");
                },
              );
            },
            child: const Text('Get Data From Android in Flutter'),
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {
              androidSavePrefData();
            },
            child: const Text('Save in Android Preference'),
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {
              androidGetPrefData().then(
                (value) {
                  print("IN_FLUTTER_FROM_ANDROID : $value");
                },
              );

              // print(
              //     "FROM_FLUTTER ${AppPreferences.getString(AppPreferences.userName)}");
            },
            child: const Text('Get Data in Flutter From Android'),
          ),
        ],
      ),
    );
  }

  /// get Pref data from android in Flutter*/
  static const String prefDataAndroidChannelName = "PrefDataAndroidChannelName";
  static const platform = MethodChannel(prefDataAndroidChannelName);
  final String androidPrefDataConnectMethod = "androidPrefDataConnectMethod";

  Future<String?> flutterGetPrefData() async {
    String result = "";
    try {
      result = await platform.invokeMethod(androidPrefDataConnectMethod);
    } on PlatformException catch (e) {
      print("Failed to Invoke: '${e.message}'.");
    }
    return result;
  }

  /// save data in Android Pref from Flutter
  static const String storeDataAndroidPrefChannelName =
      "storeDataAndroidPrefChannelName";
  static const platformTwo = MethodChannel(storeDataAndroidPrefChannelName);
  final String storeValueAndroidConnectMethod =
      "storeValueAndroidConnectMethod";

  androidSavePrefData() {
    try {
      platformTwo.invokeMethod(storeValueAndroidConnectMethod);
    } on PlatformException catch (e) {
      print("Failed to Invoke: '${e.message}'.");
    }
  }

  /// get data in Flutter from Android
  static const String getDataAndroidPrefChannelName =
      "getDataAndroidPrefChannelName";
  static const platformThree = MethodChannel(getDataAndroidPrefChannelName);
  final String getValueAndroidConnectMethod = "getValueAndroidConnectMethod";

  Future<String?> androidGetPrefData() async {
    String result = "";
    try {
      result = await platformThree.invokeMethod(
          getValueAndroidConnectMethod, {"key": "password"});
    } on PlatformException catch (e) {
      print("Failed to Invoke: '${e.message}'.");
    }
    return result;
  }
}
