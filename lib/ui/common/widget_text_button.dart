import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  final String title;
  final Function onPress;

  MyTextButton({this.title = 'Give this button text', @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        title,
        style: TextStyle(fontSize: 12, color: Colors.black54),
      ),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: onPress,
    );
  }
}
