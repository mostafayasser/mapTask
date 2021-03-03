import 'package:flutter/material.dart';
import 'screens/loginScreen.dart';
import 'screens/mainScreen.dart';
import 'screens/registrationScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
      routes: {
        MainScreen.idScreen: (context) => MainScreen(),
        LoginScreen.idScreen: (context) => LoginScreen(),
        RegistrationScreen.idScreen: (context) => RegistrationScreen(),
      },
    );
  }
}
