import 'package:android_native_flutter_db/database/database_properties.dart';
import 'package:android_native_flutter_db/database/student_database.dart';
import 'package:android_native_flutter_db/database/student_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AccessDatabase extends StatelessWidget {
  AppDatabase? database;

  AccessDatabase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () async {
              database = await $FloorAppDatabase
                  .databaseBuilder(DatabaseProperties.DB_NAME)
                  .build();
            },
            child: const Text('Initialise Db'),
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () async {
              final studentDao = database?.studentDao;
              Student student1 = Student(1, 'KP', 95);
              Student student2 = Student(2, 'Choti', 96);
              await studentDao?.insertStudent([student1, student2]);
            },
            child: const Text('Insert Data in DB From Flutter'),
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () async {
              flutterToNative();
              // retrieveUsers().then(
              //   (value) {
              //     if (value != null) {
              //       print('Data : ${value[0].name}');
              //       print('Data : ${value[1].name}');
              //     } else {
              //       print('Data Null');
              //     }
              //   },
              // );
            },
            child: const Text('Get Data from Flutter DB'),
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () async {
              androidInsertDb();
            },
            child: const Text('Insert Data in DB From Android'),
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () async {
              nativeToFlutter();
            },
            child: const Text('Get Data from Android DB'),
          ),
        ],
      ),
    );
  }

  Future<List<Student>?> retrieveUsers() async {
    return await database?.studentDao.findAllStudents();
  }

  /// access db from flutter side*/
  static const String flutterChannelName = "flutterToNative";
  static const platformOne = MethodChannel(flutterChannelName);
  final String flutterDbConnectMethod = "flutterDbConnectMethod";
  flutterToNative() {
    try {
      platformOne.invokeMethod(flutterDbConnectMethod);
    } on PlatformException catch (e) {
      print("Failed to Invoke: '${e.message}'.");
    }
  }

  /// access db from android side*/
  static const String androidChannelName = "NativeToFlutter";
  static const platformTwo = MethodChannel(androidChannelName);
  final String androidDbConnectMethod = "androidDbConnectMethod";
  nativeToFlutter() {
    try {
      platformTwo.invokeMethod(androidDbConnectMethod);
    } on PlatformException catch (e) {
      print("Failed to Invoke: '${e.message}'.");
    }
  }

  /// insert data in android db*/
  static const String insertAndroidDBChannelName = "insertAndroidDBChannelName";
  static const platformThree = MethodChannel(insertAndroidDBChannelName);
  final String androidInsertDbConnectMethod = "androidInsertDbConnectMethod";
  androidInsertDb(){
    try {
      platformThree.invokeMethod(androidInsertDbConnectMethod);
    } on PlatformException catch (e) {
      print("Failed to Invoke: '${e.message}'.");
    }
  }
}
