package com.kp.android_native_flutter_db.database

import android.annotation.SuppressLint
import android.content.Context
import android.database.sqlite.SQLiteDatabase
import android.util.Log
import kotlinx.coroutines.DelicateCoroutinesApi
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch

object DatabaseHelper {
    @SuppressLint("Range", "SdCardPath")
    @OptIn(DelicateCoroutinesApi::class)
    fun getDataFromFlutterDb() {
        try {
            val dbPath = "/data/data/com.kp.android_native_flutter_db/databases/"
            val dbName = "appDb.db"

            val db: SQLiteDatabase =
                SQLiteDatabase.openDatabase(dbPath + dbName, null, SQLiteDatabase.OPEN_READWRITE)

            Log.d("DB_DATA_FLUTTER", "Database Path " + db.path.toString())
            Log.d("DB_DATA_FLUTTER", "Database version " + db.version.toString())

            val cursor = db.query("students", null, null, null, null, null, null)

            cursor?.let {
                while (cursor.moveToNext()) {

                    val columnNames = cursor.columnNames

                    columnNames.forEach {
                        Log.d(
                            "DB_DATA_FLUTTER",
                            "$it " + cursor.getString(cursor.getColumnIndex(it))
                        )
                    }

                }
            }
        } catch (e: Exception) {
            e.printStackTrace()
        }
    }

    @OptIn(DelicateCoroutinesApi::class)
    fun getDataFromAndroidDb(context: Context) = GlobalScope.launch {
        val db: StudentDao = AppDatabase.getInstance(context)?.studentDao()!!
        val result = db.findAllStudents()
        if (result.isNotEmpty()) {
            Log.d("DB_DATA_ANDROID", "$result")
        } else {
            Log.d("DB_DATA_ANDROID", "null")
        }
    }

    @OptIn(DelicateCoroutinesApi::class)
    fun androidInsertData(context: Context) = GlobalScope.launch {
        val studentDao = AppDatabase.getInstance(context)?.studentDao()
        val student = Student(3, "Dev", 98)
        studentDao?.insertStudent(student)
        Log.d("DB_DATA_ANDROID", "Inserted Successfully")
    }


}