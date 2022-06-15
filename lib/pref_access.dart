import 'package:android_native_flutter_db/preference/app_preferences.dart';
import 'package:flutter/material.dart';

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
            AppPreferences.setString(AppPreferences.userName, "Kuldeep Pandit");
          },
          child: const Text('Save in Preference'),
        ),
        const SizedBox(
          height: 10,
        ),
        TextButton(
          onPressed: () {
           print("Pref_Result ${AppPreferences.getString(AppPreferences.userName)}");
          },
          child: const Text('Get from Preference'),
        ),
      ],
    ));
  }
}
