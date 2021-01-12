import "package:flutter/material.dart";
import "../auth/auth.dart";
import "../profile/profile.dart";

class HamburgerIconMenu extends StatefulWidget {
  @override
  _HamburgerIconMenuState createState() => _HamburgerIconMenuState();
}

class _HamburgerIconMenuState extends State<HamburgerIconMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return Profile();
                }));
              },
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 50,
                backgroundImage: NetworkImage("http://cdn.ppcorn.com/us/wp-content/uploads/sites/14/2016/01/Mark-Zuckerberg-pop-art-ppcorn.jpg"),
              ),
            ),
            FlatButton(child: Text("")),
            FlatButton(
              child: Text("Log Out"),
              onPressed: () {
                AuthService().signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
