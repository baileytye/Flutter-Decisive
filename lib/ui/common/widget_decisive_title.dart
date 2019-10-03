import 'package:decisive/resources/colors.dart';
import 'package:decisive/resources/dimensions.dart';
import 'package:decisive/resources/strings.dart';
import 'package:flutter/material.dart';

class DecisiveTitle extends StatelessWidget {
  final double width;

  DecisiveTitle({this.width = MyDimensions.loginTitleWidth});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: width,
        color: MyColors.transparentWhite,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              MyStrings.appTitle,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
              key: Key('logo'),
            ),
          ),
        ),
      ),
    );
  }
}
