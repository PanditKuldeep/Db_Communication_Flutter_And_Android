package com.example.android_native_flutter_db.global

import android.app.Application
import com.example.android_native_flutter_db.preference.SharedPreferenceManager

class App : Application() {

    override fun onCreate() {
        super.onCreate()
        SharedPreferenceManager.initPrefs(this)
    }
}