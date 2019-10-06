import 'package:decisive/ui/intro/screen_intro.dart';
import 'package:decisive/ui/login/screen_login.dart';
import 'package:decisive/ui/login/screen_root.dart';
import 'package:decisive/ui/main/screen_main.dart';
import 'package:decisive/ui/projectDetails/screen_project_details.dart';
import 'package:decisive/ui/settings/screen_settings.dart';
import 'package:flutter/material.dart';

class Router {
  static const rootScreen = '/';
  static const mainScreen = '/main';
  static const loginScreen = '/login';
  static const projectDetailsScreen = '/main/details';
  static const settingsScreen = '/main/settings';
  static const introScreen = '/intro';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case rootScreen:
        return MaterialPageRoute(builder: (_) => RootScreen());
      case introScreen:
        return MaterialPageRoute(builder: (_) => IntroScreen());
      case mainScreen:
        return MaterialPageRoute(builder: (_) => MainScreen());
      case loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case projectDetailsScreen:
        return MaterialPageRoute(builder: (_) => ProjectDetailsScreen());
      case settingsScreen:
        return MaterialPageRoute(builder: (_) => SettingsScreen());
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
