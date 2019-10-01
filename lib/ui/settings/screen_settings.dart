import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

          SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(statusBarColor: Colors.blue));

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Settings'),
      ),
    );
  }
}
