import 'package:flutter/material.dart';
import 'package:frontend/screens/registration_screen.dart';
import 'package:frontend/screens/login_screen.dart';
import 'package:frontend/screens/main_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        MainScreen.id: (context) => MainScreen(),
      },
    );
  }
}
