
import 'package:decisive/resources/colors.dart';
import 'package:decisive/resources/dimensions.dart';
import 'package:flutter/material.dart';

class EmailAndPasswordWidget extends StatelessWidget {

  final double width;

  EmailAndPasswordWidget({this.width = MyDimensions.loginTitleWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: MyColors.cardStroke),
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 6, bottom: 6),
              child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Email Address",
                    border: InputBorder.none,
                  )),
            ),
            SizedBox(
              height: 1,
              child: Container(
                color: MyColors.cardStroke,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 6, bottom: 6),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: InputBorder.none,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
