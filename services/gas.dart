import 'package:flutter/material.dart';

class gas extends StatefulWidget {
  @override
  _gasState createState() => _gasState();
}

class _gasState extends State<gas> {
  List<String> item = List();
  String service;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gas Service"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: <Widget>[
          TextField(
            onChanged: (str) {
              service = str;
            },
            maxLength: 50,
          ),
          RaisedButton(
            child: Text('Submit Request'),
            onPressed: () {
              setState(() {
                item.add(service);
              });
            },
          ),
        ],
      ),
    );
  }
}