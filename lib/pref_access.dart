import 'package:android_native_flutter_db/preference/app_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccessPreference extends StatelessWidget {
  SharedPreferences? preferences;

  AccessPreference({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () async {
              preferences = await SharedPreferences.getInstance();
            },
            child: const Text('Init Pref'),
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {
              // AppPreferences.setString(
              //     AppPreferences.userName, "Kuldeep Pandit");
              preferences?.setString('userName', 'Kuldeep Pandit');
            },
            child: const Text('Save in Preference'),
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {
              androidGetPrefData().then(
                    (value) {
                  print("FROM_ANDROID : $value");
                },
              );
              // print(
              //     "Pref_Result ${AppPreferences.getString(AppPreferences.userName)}");
            },
            child: const Text('Get from android side Preference'),
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {
              // print(
              //     "Pref_Result ${AppPreferences.getString(AppPreferences.userName)}");
              print(
                  "FROM_FLUTTER ${preferences?.getString('userName')}");
            },
            child: const Text('Get from flutter side Preference'),
          ),
        ],
      ),
    );
  }

  /// get Pref data from android*/
  static const String prefDataAndroidChannelName = "PrefDataAndroidChannelName";
  static const platform = MethodChannel(prefDataAndroidChannelName);
  final String androidPrefDataConnectMethod = "androidPrefDataConnectMethod";

  Future<String?> androidGetPrefData() async {
    String result = "";
    try {
      result = await platform.invokeMethod(androidPrefDataConnectMethod);
    } on PlatformException catch (e) {
      print("Failed to Invoke: '${e.message}'.");
    }
    return result;
  }
}
