import 'package:flutter/material.dart';

class lock extends StatefulWidget {
  @override
  _lockState createState() => _lockState();
}

class _lockState extends State<lock> {
  List<String> item = List();
  String service;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lock Service"),
        backgroundColor: Colors.purple,
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