import 'dart:async';

import 'package:android_native_flutter_db/database/database_properties.dart';
import 'package:android_native_flutter_db/database/student_dao.dart';
import 'package:android_native_flutter_db/database/student_entity.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'student_database.g.dart';

@Database(version: DatabaseProperties.DB_VERSION, entities: [Student])
abstract class AppDatabase extends FloorDatabase{
  StudentDao get studentDao;
}