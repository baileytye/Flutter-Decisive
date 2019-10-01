import 'package:decisive/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.white,
      ),
      onGenerateRoute: Router.generateRoute,
      initialRoute: Router.rootScreen,
    );
  }
}
