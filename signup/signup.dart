import "package:flutter/material.dart";
import "../auth/auth.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "package:provider/provider.dart";
import "../models/user.dart";

enum UserType { mechanic, client }

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = AuthService();
  final Firestore _firestore = Firestore.instance;
  String _username;
  String _email;
  String _password;
  UserType _radioGroupValue = UserType.client;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
      backgroundColor: Color(0xFFFAF7EF),
      appBar: AppBar(
        title: Text("SignUp"),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 16.0, right: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: "UserName",
                icon: Icon(Icons.person),
              ),
              onChanged: (value) {
                setState(() {
                  _username = value;
                });
              },
            ),
            SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                labelText: "Email",
                icon: Icon(Icons.alternate_email),
              ),
              onChanged: (value) {
                setState(() {
                  _email = value;
                });
              },
            ),
            SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                labelText: "Password",
                icon: Icon(Icons.lock),
              ),
              onChanged: (value) {
                setState(() {
                  _password = value;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Radio(
                        value: UserType.client,
                        groupValue: _radioGroupValue,
                        onChanged: (value) {
                          setState(() {
                            _radioGroupValue = value;
                          });
                        },
                      ),
                      Text("Cient"),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Radio(
                        value: UserType.mechanic,
                        groupValue: _radioGroupValue,
                        onChanged: (value) {
                          setState(() {
                            _radioGroupValue = value;
                          });
                        },
                      ),
                      Text("Mechanic"),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: FlatButton(
                child: Text("Sign Up"),
                color: Color(0xFFA5D6F2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                onPressed: () {
                  _auth
                      .signUp(email: _email, password: _password)
                      .then((userId) {
                    _firestore.collection("users").document(userId).setData({
                      "uid": userId,
                      "userName": _username,
                      "email": _email,
                    }).then((value) {
                      Navigator.pop(context);
                    }).catchError((error) {
                      print("error saving to database: $error");
                    });
                  }).catchError((error) {
                    print("Error signing up: $error");
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
