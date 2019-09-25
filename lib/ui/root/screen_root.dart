import 'package:decisive/ui/login/screen_login.dart';
import 'package:decisive/ui/main/screen_main.dart';
import 'package:flutter/material.dart';

class RootScreen extends StatefulWidget {
  @override
  _RootScreenState createState() => _RootScreenState();
}

enum AuthStatus {
  signedIn,
  notSignedIn,
}

class _RootScreenState extends State<RootScreen> {
  AuthStatus authStatus = AuthStatus.notSignedIn;

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.notSignedIn:
        return LoginScreen();
      case AuthStatus.signedIn:
        return MainScreen();
      default:
        return LoginScreen();
    }
  }
}
