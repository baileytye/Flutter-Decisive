import 'package:flutter/material.dart';
import '../../colors.dart';
import '../../dimensions.dart';


class DecisiveTitle extends StatelessWidget {

  final double width;

  DecisiveTitle({this.width = MyDimensions.loginTitleWidth});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
          child: Container(
        width: width,
        color: MyColors.transparentWhite,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              'Decisive.',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
