import 'package:flutter/material.dart';

class MyToolbar extends StatelessWidget {

  MaterialColor color;
  var title;
  var optionsMenu;

  MyToolbar({this.color = Colors.blue, this.title = 'Title', @required this.optionsMenu});

  @override
  Widget build(BuildContext context) {
    return AppBar(
            backgroundColor: color,
            centerTitle: true,
            title: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            actions: <Widget>[optionsMenu],
          );
  }
}
