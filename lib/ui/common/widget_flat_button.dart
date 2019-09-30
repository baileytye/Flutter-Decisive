import 'package:flutter/material.dart';

class MyFlatButton extends StatelessWidget {
  final width, text;
  final Function onPress;

  MyFlatButton(
      {this.width = double.infinity,
      this.text = 'Button',
      @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: width,
      child: OutlineButton(
        highlightedBorderColor: Colors.black,
        borderSide: BorderSide(color: Colors.black54),
        onPressed: onPress,
        child: Text(
          text,
          style: TextStyle(color: Colors.black54),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
      ),
    );
  }
}
