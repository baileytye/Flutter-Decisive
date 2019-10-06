import 'package:decisive/data/repositories/user_repository.dart';
import 'package:decisive/resources/colors.dart';
import 'package:decisive/resources/dimensions.dart';
import 'package:decisive/resources/strings.dart';
import 'package:decisive/ui/common/widget_decisive_title.dart';
import 'package:decisive/ui/common/widget_flat_button.dart';
import 'package:decisive/ui/common/widget_text_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

enum SignInState { signIn, signUp }

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin{
  final _formKey = GlobalKey<FormState>();
  var _isLoading = false;
  var _email;
  var _password;
  SignInState signInState = SignInState.signIn;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserRepository>(context);

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
                    _emailAndPassword(),
                    SizedBox(height: 16),
                    _forgotPassword(),
                    SizedBox(height: 20),
                    _signInButton(context, user),
                    SizedBox(height: 20),
                    _noAccountButton(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  MyTextButton _noAccountButton(BuildContext context) {
    return MyTextButton(
      title: (signInState == SignInState.signIn)
          ? MyStrings.buttonNoAccount
          : MyStrings.buttonHaveAccount,
      onPress: () {
        setState(() {
          _formKey.currentState.reset();
          if (signInState == SignInState.signIn) {
            signInState = SignInState.signUp;
          } else {
            signInState = SignInState.signIn;
          }
        });
      },
    );
  }

  Widget _signInButton(BuildContext context, UserRepository user) {
    return MyFlatButton(
      onPress: () {
        final form = _formKey.currentState;
        form.save();

        if (form.validate()) {
          print("$_email , $_password");

          if (signInState == SignInState.signIn) {
            user.signIn(_email, _password);
          } else if (signInState == SignInState.signUp) {
            user.signUp(_email, _password);
          }
        }
      },
      width: MyDimensions.loginTitleWidth,
      text: (signInState == SignInState.signIn)
          ? MyStrings.buttonSignIn
          : MyStrings.buttonSignUp,
    );
  }

  Widget _forgotPassword() {
    return MyTextButton(
      title: (signInState == SignInState.signIn)
          ? MyStrings.buttonForgotPassword
          : '',
      onPress: () {
        print('Forgot password');
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

  Widget _emailAndPassword() {
    return Container(
      width: MyDimensions.loginTitleWidth,
      decoration: BoxDecoration(
        border: Border.all(color: MyColors.cardStroke),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 6, bottom: 6),
                child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) => _email = value,
                    validator: (value) => _validateEmail(value),
                    decoration: InputDecoration(
                      hintText: MyStrings.hintEmail,
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
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 6, bottom: 6),
                child: TextFormField(
                  obscureText: true,
                  validator: (value) => _validatePassword(value),
                  onSaved: (value) => _password = value,
                  decoration: InputDecoration(
                    hintText: MyStrings.hintPassword,
                    border: InputBorder.none,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _validateEmail(String value) {
    if (value.isEmpty) {
      return "Please enter a valid email";
    }
    return null;
  }

  _validatePassword(String value) {
    if (value.isEmpty) {
      return "Please enter your password";
    }
    return null;
  }
}
