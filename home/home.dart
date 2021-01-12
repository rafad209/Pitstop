import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import "./hamburgericonmenu.dart";
import "package:google_maps_flutter/google_maps_flutter.dart";
import "../auth/auth.dart";
import "slideupcontainer.dart";
import "package:provider/provider.dart";
import "../models/user.dart";
import "package:sliding_up_panel/sliding_up_panel.dart";
import "slideupcontainer.dart";

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _firestore = Firestore.instance;

  GoogleMapController _mapController;

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _mapController = controller;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: Drawer(
        child: HamburgerIconMenu(),
      ),
      appBar: AppBar(
        title: Text(
          "PitStop",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SlidingUpPanel(
        body: Container(
          child: GoogleMap(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height / 12),
            initialCameraPosition: CameraPosition(
              target: LatLng(37.4946, -120.8460),
              zoom: 15,
            ),
            onMapCreated: _onMapCreated,
            myLocationEnabled: true,
          ),
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        panel: SlideUpContainer(),
      ),
    );
  }
}
