import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'login_screen.dart';
// import 'registration_screen.dart';
import 'package:frontend/constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:frontend/components/mat_button.dart';
import 'package:frontend/data_models/user.dart';
import 'package:frontend/screens/registration_screen.dart';
import 'package:frontend/screens/login_screen.dart';
import 'package:openapi/api.dart';

import 'main_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  // bool showSpinner = false;
  String email;
  String password;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundDark,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Text('🚀🌕', style: TextStyle(fontSize: 80)),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Login',
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text('Welcome back, Sign in to continue',
                    style: TextStyle(color: kSecondaryPinkDark, fontSize: 16))
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            TextFormField(
                cursorColor: kSecondaryPinkDark,
                style: TextStyle(color: kSecondaryPinkDark),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(color: kSecondaryPinkDark),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kSecondaryPinkDark)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kSecondaryPinkDark)))),
            SizedBox(
              height: 8.0,
            ),
            TextFormField(
                style: TextStyle(color: kSecondaryPinkDark),
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(color: kSecondaryPinkDark),
                    suffix: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RegistrationScreen.id);
                        },
                        child: Text(
                          'Forgot password?',
                          // style: DefaultTextStyle.of(context).style
                        )),
                    suffixStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kSecondaryPinkDark)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kSecondaryPinkDark)))),
            SizedBox(
              height: 48.0,
            ),
            MatButton(
              title: 'Sign In',
              colour: kFourthBlueDark,
              onPressed: () async {
                // setState(() {
                //   showSpinner = true;
                // });
                try {
                  attemptLogin();
                  print('User will be logged in');
                  // setState(() {
                  //   showSpinner = false;
                  // });
                } catch (e) {
                  print(e);
                }
              },
            ),
            SizedBox(
              height: 80.0,
            ),
            MatButton(
              title: 'Continue with Google',
              iconPath: '../../assets/google-logo.png',
              textColor: kBackgroundDark,
              colour: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
            MatButton(
              iconPath: '../../assets/facebook-logo.png',
              title: 'Continue with Facebook',
              colour: Colors.blueAccent,
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
            SizedBox(
              height: 60.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account? \ ',
                  style: TextStyle(color: kSecondaryPinkDark),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RegistrationScreen.id);
                    },
                    child: Text(
                      'Create account',
                      // style: DefaultTextStyle.of(context).style
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }

  void attemptLogin() async {
    User currUser;
    final apiInstance = LoginApi();

    try {
      final result = apiInstance.loginPost(
          inlineObject:
              InlineObject(emailAddress: this.email, password: this.password));
      var response = await result;
      // currUser = User(1, "hi", "first", "middle", "lastName", 2);
      currUser = User(
        response.userId,
        response.emailAddress,
        response.firstName,
        response.middleName,
        response.lastName,
        response.investmentStrategy,
        response.token,
      );
      if (currUser != Null) {
        Navigator.popAndPushNamed(context, MainScreen.id, arguments: currUser);
      }
    } catch (e) {
      print('Exception when calling LoginApi->loginPost(): $e\n');
      showPrompt("Invalid username or password, please try again");
    }
  }

  void showPrompt(String prompt) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(prompt,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16,
                color: kBackgroundDark,
                fontWeight: FontWeight.w400)),
      ),
    );
  }
}
