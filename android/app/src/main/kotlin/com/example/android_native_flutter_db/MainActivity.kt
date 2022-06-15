package com.example.android_native_flutter_db

import android.annotation.SuppressLint
import com.example.android_native_flutter_db.database.DatabaseHelper
import com.example.android_native_flutter_db.preference.PreferenceHelper
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    @SuppressLint("LongLogTag")
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        /** use to get data from flutter db*/
        MethodChannel(flutterEngine.dartExecutor, AppConstant.flutterChannelName)
            .setMethodCallHandler { call: MethodCall, result: MethodChannel.Result? ->
                if (call.method == AppConstant.flutterDbConnectMethod) {
                    DatabaseHelper.getDataFromFlutterDb()
                }
            }

        /** use to get data from android db*/
        MethodChannel(flutterEngine.dartExecutor, AppConstant.androidChannelName)
            .setMethodCallHandler { call: MethodCall, result: MethodChannel.Result? ->
                if (call.method == AppConstant.androidDbConnectMethod) {
                    DatabaseHelper.getDataFromAndroidDb(this)
                }
            }

        /** use to insert data from android side*/
        MethodChannel(flutterEngine.dartExecutor, AppConstant.insertAndroidDBChannelName)
            .setMethodCallHandler { call: MethodCall, result: MethodChannel.Result? ->
                if (call.method == AppConstant.androidInsertDbConnectMethod) {
                    DatabaseHelper.androidInsertData(this)
                }
            }

        MethodChannel(flutterEngine.dartExecutor, AppConstant.prefDataAndroidChannelName)
            .setMethodCallHandler { call: MethodCall, result: MethodChannel.Result? ->
                if (call.method == AppConstant.androidPrefDataConnectMethod) {
                    val value = PreferenceHelper.getDataFromFlutterPref(this)
                    result?.success(value)
                }
            }
    }

}
