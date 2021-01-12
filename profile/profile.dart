import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:pitstop/home/hamburgericonmenu.dart';
import 'package:pitstop/profile/settingscreens/editprofile.dart';
import 'package:pitstop/profile/utilites/profilescreens/currency.dart';
import "package:provider/provider.dart";
import 'settings.dart';
import "../models/user.dart";
import "../auth/auth.dart";
import "chat.dart";

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool turnOnNotification = false;
  bool turnOnLocation = false;
  final Firestore _firestore = Firestore.instance;

  String userName = "";
  String _username;

  @override
  Widget build(BuildContext cx) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 70.0,
                  backgroundImage: NetworkImage(
                      "http://cdn.ppcorn.com/us/wp-content/uploads/sites/14/2016/01/Mark-Zuckerberg-pop-art-ppcorn.jpg"),
                ),
                Text(
                  "Username: Rafad209",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  "Rating: ",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(5, (index) {
                    return Icon(
                      index < 5 ? Icons.star : Icons.star_border,
                    );
                  }),
                ),
                Container(
                  height: 30.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Center(
                    child: Text(
                      "Edit",
                      style: TextStyle(color: Colors.blue, fontSize: 16.0),
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Account",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ),
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.grey.shade400,
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
                          Icons.location_on,
                          color: Colors.black,
                        ),
                        title: Text('Location'),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          //Navigator.of(context).push(
                          //MaterialPageRoute(
                          //builder: (context) {
                          //return Privacy();
                          //},
                          //),
                          //);
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
                          Icons.visibility,
                          color: Colors.black,
                        ),
                        title: Text("Change Password"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          //Navigator.of(context).push(
                          //MaterialPageRoute(
                          //builder: (context) {
                          //return Notifications();
                          //},
                          //),
                          //);
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
                          Icons.payment,
                          color: Colors.black,
                        ),
                        title: Text("Payment"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          //Navigator.of(context).push(
                          //MaterialPageRoute(
                          //builder: (context) {
                          //return Security();
                          //},
                          //),
                          //);
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
                        title: Text(
                          "Notifications",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
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
                        title: Text("App Notifications"),
                        trailing: Switch(
                            value: turnOnNotification,
                            onChanged: (bool value) {
                              setState(() {
                                turnOnNotification = value;
                              });
                            }),
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
                          Icons.my_location,
                          color: Colors.black,
                        ),
                        title: Text("Location Tracking"),
                        trailing: Switch(
                            value: turnOnLocation,
                            onChanged: (bool value) {
                              setState(() {
                                turnOnLocation = value;
                              });
                            }),
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
                        title: Text(
                          "Other",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
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
                          Icons.language,
                          color: Colors.black,
                        ),
                        title: Text("Language"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () async {
                          // await _auth.signOut();
                          print("ya me sali");
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
                          Icons.attach_money,
                          color: Colors.black,
                        ),
                        title: Text("Currency"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () async {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return Currency();
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
