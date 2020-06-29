import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:map_provider/map_provider.dart';
import 'package:tripzone/landingPage/landingPage_view.dart';
// import 'package:tripzone/models/destination_model.dart';


import 'package:tripzone/notifier/destinasion_notifier.dart';
import 'package:tripzone/models/destinasion.dart';



class GotoMaps extends StatefulWidget {
  final Destinasion destination;

  GotoMaps({this.destination});



  @override
  _GotoMapsState createState() => new _GotoMapsState();
}

class _GotoMapsState extends State<GotoMaps> {


  @override
  Widget build(BuildContext context) {
    final int screenWidth = MediaQuery.of(context).size.width.toInt();
    final int screenHeight = MediaQuery.of(context).size.height.toInt();
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
            icon: Icon(FontAwesomeIcons.arrowLeft),
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (context){
                return new LandingPage();
              }));
            }),
        title: Center(
          child: Text('Maps',
            style: TextStyle(
                color: Colors.white
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Image.asset(
                'assets/logo_white_tripzone.png',
                height: 32.0,
              ),
              color: Colors.white,
              onPressed: () {
                //
              }),
        ],
      ),
      body: Center(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width:  MediaQuery.of(context).size.width,
            child: MapProvider(
              google_api_key: 'AIzaSyByZD-2_rAt6GvGAt_44ruznQPDiZ8ldMQ',
              width: screenWidth,
              height: screenHeight,
              latitude: widget.destination.latitude,
              longitude: widget.destination.longitude,
              zoom: 15,
            )
        ),
      ),
    );
  }
}