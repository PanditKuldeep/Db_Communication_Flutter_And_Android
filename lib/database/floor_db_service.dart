import 'package:android_native_flutter_db/database/student_database.dart';
import 'package:floor/floor.dart';
import 'package:flutter/foundation.dart';

class FloorDbService {
  static final FloorDbService connect = FloorDbService._internal();

  FloorDbService._internal();

  static String? dbName;
  static AppDatabase? _database;

  factory FloorDbService(String databaseName) {
    dbName = databaseName;
    return connect;
  }

  static Future<AppDatabase> get db async {
    _database ??= await _initializeDatabase();
    return _database!;
  }

  static Future<AppDatabase> _initializeDatabase() async {
    return await $FloorAppDatabase
        .databaseBuilder((await getDbPath()) + dbName!)
        .addCallback(dbCallBack)
        .build();
  }

 static Future<String> getDbPath() async {
    if (kReleaseMode) {
      return '';
    } else {
      return '';
    }
  }

  static final dbCallBack = Callback(
    onCreate: (database, version) async {
      print("created");
      /* database has been created */
      print("Database Path: ${database.path}");
    },
    onOpen: (database) async {
      /* database has been opened */
    },
    onUpgrade: (database, startVersion, endVersion) {
      /* database has been upgraded */
    },
  );

  static Future<AppDatabase> getAppDatabase() {
    return db;
  }
}
