import "package:flutter/material.dart";
import '../login/login_welcome.dart';
import "../login/login.dart";
import "package:provider/provider.dart";
import "../models/user.dart";
import "../auth/wrapper.dart";

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  String _currentScreen = "login_welcome";

  void updateCurrentScreen(String currentScreen) {
    setState(() {
      _currentScreen = currentScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (_currentScreen) {
      case "login_welcome":
        return LoginWelcome();
      case "login":
        return Login();
    }
  }
}
