import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'battery.dart';

class serviceList extends StatefulWidget {
  @override
  _serviceListState createState() => _serviceListState();
}

class _serviceListState extends State<serviceList> {
  List<String> item = List();

  String service;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Service Requests"),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: <Widget>[
          ListView(
            shrinkWrap: true,
            children: item.map((element) => Text(element)).toList(),
          ),
        ],
      ),
    );
  }
}