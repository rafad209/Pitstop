import 'package:flutter/material.dart';

class tire extends StatefulWidget {
  @override
  _tireState createState() => _tireState();
}

class _tireState extends State<tire> {
  List<String> item = List();
  String service;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tire Service"),
        backgroundColor: Colors.red,
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