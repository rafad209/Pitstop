import 'package:flutter/material.dart';

class battery extends StatefulWidget {
  @override
  _batteryState createState() => _batteryState();
}

class _batteryState extends State<battery> {
  List<String> item = List();
  String service;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Battery Service",
        textAlign: TextAlign.center,),
        backgroundColor: Colors.orange,
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