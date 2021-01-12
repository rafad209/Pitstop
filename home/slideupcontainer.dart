import 'dart:async';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:pitstop/home/BouncyPageRoute.dart';
import 'package:pitstop/home/confirmation.dart';
import 'package:pitstop/services/battery.dart';
import 'package:pitstop/services/gas.dart';
import 'package:pitstop/services/lock.dart';
import 'package:pitstop/services/serviceList.dart';
import 'package:pitstop/services/tire.dart';
import "../models/user.dart";
import "package:provider/provider.dart";
import "../auth/auth.dart";
import "roundbutton.dart";

class SlideUpContainer extends StatefulWidget {
  @override
  _SlideUpContainerState createState() => _SlideUpContainerState();
}

class _SlideUpContainerState extends State<SlideUpContainer> {
  String _postText = "";
  Firestore _firestore = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    print("${Provider.of<User>(context)}");
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10),
            width: 50,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RoundButton(
                  icon: Icon(
                    Icons.local_gas_station,
                    size: 40,
                  ),
                  color: Colors.blue,
                  onPressed: () async {
                    final action = await Dialogs.yesAbortDialog(
                        context, 'Need gas?', "");
                    if (action == DialogAction.yes) {
                      Navigator.push(context, BouncyPageRoute(widget: gas())
                      );
                    }
                  }
                ),
                RoundButton(
                  icon: Icon(Icons.arrow_drop_down_circle),
                  color: Colors.red,
                  onPressed: () async {
                    final action = await Dialogs.yesAbortDialog(
                        context, 'Gotta flat?', '');
                    if (action == DialogAction.yes) {
                      Navigator.push(context, BouncyPageRoute(widget: tire())
                      );
                    }
                  }
                ),
                RoundButton(
                  icon: Icon(Icons.battery_unknown),
                  color: Colors.orange,
                  onPressed: () async {
                    final action = await Dialogs.yesAbortDialog(
                        context, 'Out of battery?', 'Vroom Vroom');
                    if (action == DialogAction.yes) {
                      Navigator.push(context, BouncyPageRoute(widget: battery())
                      );
                    }
                  }
                ),
                RoundButton(
                  icon: Icon(Icons.lock),
                  color: Colors.purple,
                  onPressed: () async {
                    final action = await Dialogs.yesAbortDialog(
                        context, 'Locked out of your car?', "");
                    if (action == DialogAction.yes) {
                      Navigator.push(context, BouncyPageRoute(widget: lock())
                      );
                    }
                  }
                ),
                RoundButton(
                    icon: Icon(Icons.list),
                    color: Colors.white,
                    onPressed: () async {
                      final action = await Dialogs.yesAbortDialog(
                          context, 'Want to see awaiting service requests?','');
                      if (action == DialogAction.yes) {
                        Navigator.push(context, BouncyPageRoute(widget: serviceList())
                        );
                      }
                    }
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



