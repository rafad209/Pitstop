import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.greenAccent,
        title: Text(
          'Notifications',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 10.0,
            ),
            Text(
              "Notification Settings",
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SwitchListTile(
              activeColor: Colors.greenAccent,
              contentPadding: const EdgeInsets.all(0),
              value: true,
              title: Text("Recieved notification"),
              onChanged: (val) {},
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              width: double.infinity,
              height: 1.0,
              color: Colors.grey.shade400,
            ),
            SwitchListTile(
              activeColor: Colors.greenAccent,
              contentPadding: const EdgeInsets.all(0),
              value: false,
              title: Text("Recieved newsletter"),
              onChanged: null,
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              width: double.infinity,
              height: 1.0,
              color: Colors.grey.shade400,
            ),
            SwitchListTile(
              activeColor: Colors.greenAccent,
              contentPadding: const EdgeInsets.all(0),
              value: true,
              title: Text("Recieved offer notification"),
              onChanged: (val) {},
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              width: double.infinity,
              height: 1.0,
              color: Colors.grey.shade400,
            ),
            SwitchListTile(
              activeColor: Colors.greenAccent,
              contentPadding: const EdgeInsets.all(0),
              value: false,
              title: Text("App Updates"),
              onChanged: null,
            ),
          ],
        ),
      ),
    );
  }
}
