import 'package:decisive/data/repositories/user_repository.dart';
import 'package:decisive/ui/intro/screen_intro.dart';
import 'package:decisive/ui/login/screen_login.dart';
import 'package:decisive/ui/main/screen_main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RootScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (_) => UserRepository.instance(),
      child: Consumer(builder: (context, UserRepository user, _) {
        switch (user.status) {
          case Status.Authenticated:
            return MainScreen();
          case Status.Uninitialized:
            return IntroScreen();
          default:
            return LoginScreen();
        }
      }),
    );
  }
}
