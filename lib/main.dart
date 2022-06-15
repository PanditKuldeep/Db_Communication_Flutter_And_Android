import 'package:android_native_flutter_db/database/database_properties.dart';
import 'package:android_native_flutter_db/database/student_entity.dart';
import 'package:android_native_flutter_db/databse_access.dart';
import 'package:android_native_flutter_db/pref_access.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'database/student_database.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/database_screen': (BuildContext context) => AccessDatabase(),
        '/pref_screen': (BuildContext context) => const AccessPreference(),
      },
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/database_screen');
            },
            child: const Text('Database Screen'),
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/pref_screen');
            },
            child: const Text('Preferences Screen'),
          ),
        ],
      ),
    );
  }
}
