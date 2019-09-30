import 'package:decisive/resources/colors.dart';
import 'package:decisive/resources/dimensions.dart';
import 'package:decisive/resources/strings.dart';
import 'package:decisive/ui/common/widget_decisive_title.dart';
import 'package:decisive/ui/common/widget_email_and_password.dart';
import 'package:decisive/ui/common/widget_flat_button.dart';
import 'package:decisive/ui/common/widget_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../router.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _isLoading = false;
  var _email;
  var _password;
  var _errorMessage;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: MyColors.colorPrimaryDark));

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: MyColors.colorPrimaryDark,
          elevation: 0,
        ),
      ),
      body: Builder(
        builder: (context) => SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Image.asset(
                'assets/login_background.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
              Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: MyDimensions.loginTitleTopMargin),
                    DecisiveTitle(),
                    SizedBox(height: MyDimensions.loginTitleBottomMargin),
                    EmailAndPasswordWidget(),
                    SizedBox(height: 16),
                    _forgotPassword(),
                    SizedBox(height: 20),
                    _signInButton(context),
                    SizedBox(height: 20),
                    _createAccount(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  MyTextButton _createAccount(BuildContext context) {
    return MyTextButton(
      title: MyStrings.buttonNoAccount,
      onPress: () {
        Scaffold.of(context).showSnackBar(
          new SnackBar(
            content: new Text('No account!'),
          ),
        );
      },
    );
  }

  MyFlatButton _signInButton(BuildContext context) {
    return MyFlatButton(
      onPress: () {
        Navigator.pushReplacementNamed(context, Router.mainScreen);
      },
      width: MyDimensions.loginTitleWidth,
      text: MyStrings.buttonSignIn,
    );
  }

  MyTextButton _forgotPassword() {
    return MyTextButton(
      title: MyStrings.buttonForgotPassword,
      onPress: () {
        print('Button pressed');
      },
    );
  }

  Widget showLoading() {
    if (_isLoading) {
      return Text("Loading");
    }
    return Container(
      height: 0,
      width: 0,
    );
  }
}
