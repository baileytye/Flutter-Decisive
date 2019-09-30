import 'package:decisive/ui/common/widget_flat_button.dart';
import 'package:flutter/material.dart';

import '../../router.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Screen"),
      ),
      body: Center(
        child: MyFlatButton(
          width: 100.0,
          text: 'Sign out',
          onPress: () {
            Navigator.pushReplacementNamed(context, Router.rootScreen);
          },
        ),
      ),
    );
  }
}
