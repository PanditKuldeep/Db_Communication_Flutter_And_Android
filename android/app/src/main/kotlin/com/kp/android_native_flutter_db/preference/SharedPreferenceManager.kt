package com.kp.android_native_flutter_db.preference

import android.content.Context
import android.content.SharedPreferences

object SharedPreferenceManager {
    private var sharedPreferences: SharedPreferences? = null
    private var editor: SharedPreferences.Editor? = null
    val APP_PREFERENCE_TAG = "app_prefs"

    ///keys
    var userName: String = "user_name"
    var password: String = "password"

    fun initPrefs(context: Context) {
        sharedPreferences = context.getSharedPreferences(APP_PREFERENCE_TAG, Context.MODE_PRIVATE)
        editor = sharedPreferences!!.edit()
    }

    private fun getSharedPreferences(): SharedPreferences? {
        return sharedPreferences
    }

    /// sets method
    fun setString(key: String?, storeValue: String) {
        getSharedPreferences()!!.edit().putString(key, storeValue).apply()
    }

    /// gets method
    fun getString(key: String?): String? {
        if (getSharedPreferences() == null) return null
        return getSharedPreferences()!!.getString(key, "")
    }



}