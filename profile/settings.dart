import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'settingscreens/privacy.dart';
import 'settingscreens/security.dart';
import '../auth/auth.dart';
import 'settingscreens/notifications.dart';
import 'settingscreens/help.dart';
import 'settingscreens/about.dart';
import 'settingscreens/editprofile.dart';

class Settings extends StatelessWidget {
  AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.greenAccent,
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Card(
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Colors.greenAccent,
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return EditProfile();
                          },
                        ),
                      );
                    },
                    title: Text(
                      'Burrito',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage('http://cdn.ppcorn.com/us/wp-content/uploads/sites/14/2016/01/Mark-Zuckerberg-pop-art-ppcorn.jpg'),
                    ),
                    trailing: Icon(Icons.edit),
                  ),
                ),
                const SizedBox(height: 10.0),
                Card(
                  elevation: 0,
                  margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                        title: Text('Privacy'),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return Privacy();
                              },
                            ),
                          );
                        },
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                        ),
                        width: double.infinity,
                        height: 1.0,
                        color: Colors.grey.shade400,
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.notifications,
                          color: Colors.black,
                        ),
                        title: Text("Notifications"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return Notifications();
                              },
                            ),
                          );
                        },
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                        ),
                        width: double.infinity,
                        height: 1.0,
                        color: Colors.grey.shade400,
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.security,
                          color: Colors.black,
                        ),
                        title: Text("Security"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return Security();
                              },
                            ),
                          );
                        },
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                        ),
                        width: double.infinity,
                        height: 1.0,
                        color: Colors.grey.shade400,
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.help_outline,
                          color: Colors.black,
                        ),
                        title: Text("Help"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return Help();
                              },
                            ),
                          );
                        },
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                        ),
                        width: double.infinity,
                        height: 1.0,
                        color: Colors.grey.shade400,
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.info_outline,
                          color: Colors.black,
                        ),
                        title: Text("About"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return About();
                              },
                            ),
                          );
                        },
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                        ),
                        width: double.infinity,
                        height: 1.0,
                        color: Colors.grey.shade400,
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.exit_to_app,
                          color: Colors.black,
                        ),
                        title: Text("Sign Out"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () async {
                          await _auth.signOut();
                          print("ya me sali");
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
