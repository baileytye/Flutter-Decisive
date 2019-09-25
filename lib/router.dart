import 'package:decisive/ui/login/screen_login.dart';
import 'package:decisive/ui/main/screen_main.dart';
import 'package:decisive/ui/root/screen_root.dart';
import 'package:flutter/material.dart';

class Router {
  static const rootScreen = '/';
  static const mainScreen = '/main';
  static const loginScreen = '/login';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case rootScreen:
        return MaterialPageRoute(builder: (_) => RootScreen());
      case mainScreen:
        return MaterialPageRoute(builder: (_) => MainScreen());
      case loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
