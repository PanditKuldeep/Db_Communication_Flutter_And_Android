import 'package:flutter/material.dart';

class AccessPreference extends StatelessWidget {
  const AccessPreference({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  Center(
        child: Text(
          'Pref Screen',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
