import 'package:flutter/material.dart';
import 'package:pitstop/auth/auth.dart';
import "auth/wrapper.dart";
import "package:provider/provider.dart";
import "models/user.dart";

void main() => runApp(PitStop());

class PitStop extends StatefulWidget {
  @override
  _PitStopState createState() => _PitStopState();
}

class _PitStopState extends State<PitStop> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
