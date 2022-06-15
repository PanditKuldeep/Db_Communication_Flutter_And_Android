package com.example.android_native_flutter_db.preference

import android.content.Context
import android.content.SharedPreferences

object PreferenceHelper {

    fun getDataFromFlutterPref(context: Context): String? {
        val prefName = "FlutterSharedPreferences";
        val prf: SharedPreferences = context.getSharedPreferences(prefName, Context.MODE_PRIVATE)
        return prf.getString("flutter." + "userName", "No Result")
    }
}

