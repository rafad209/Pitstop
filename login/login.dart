import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import '../auth/auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();

  String _email = "";
  String _password = "";
  bool _isDisabled = false;

  @override
  Widget build(BuildContext context) {
    void _login() async {
      setState(() {
        _isDisabled = true;
      });
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Center(child: CircularProgressIndicator());
          });

      await _auth.signInWithEmailAndPassword(email: _email, password: _password);
      setState(() {
        _isDisabled = false;
      });

      //not sure why its like this
      Navigator.pop(context); // the first one pops the showDialog screen back to the login screen
      Navigator.pop(context); // the second one pops the login screen to the home_tabs screen
    }

    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Color(0xFFFAF7EF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            "Log In",
            style: TextStyle(
              fontSize: 50.0,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.only(left: 16.0, right: 30.0),
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.alternate_email,
                      ),
                      labelText: "Email"),
                  onChanged: (value) {
                    setState(() {
                      _email = value;
                    });
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                    labelText: "Password",
                  ),
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      _password = value;
                    });
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
            child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                color: Colors.red,
                child: Text("Login"),
                onPressed: _isDisabled ? null : _login),
          ),
          SizedBox(height: 200),
        ],
      ),
    );
  }
}
