import "package:flutter/material.dart";
import '../home/home.dart';
import "package:provider/provider.dart";
import '../models/user.dart';
import "authenticate.dart";

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    // this gets the user from the provider
    final user = Provider.of<User>(context);
    // TODO: implement build
    print("user in wrapper: $user");
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
