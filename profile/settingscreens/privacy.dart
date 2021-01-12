import 'package:flutter/material.dart';

class Privacy extends StatefulWidget {
  @override
  _PrivacyState createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.greenAccent,
        title: Text(
          'Privacy',
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
                          Icons.lock_outline,
                          color: Colors.black,
                        ),
                        title: Text('Account Privacy'),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {},
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
                          Icons.block,
                          color: Colors.black,
                        ),
                        title: Text("Restricted Accounts"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {},
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
                          Icons.highlight_off,
                          color: Colors.black,
                        ),
                        title: Text("Blocked Accounts"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {},
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
                          Icons.notifications_off,
                          color: Colors.black,
                        ),
                        title: Text("Muted Accounts"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {},
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
                          Icons.people,
                          color: Colors.black,
                        ),
                        title: Text("Accounts You Follow"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {},
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
