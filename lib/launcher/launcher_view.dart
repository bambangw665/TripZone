import 'package:flutter/material.dart';
import 'dart:async';
import 'package:tripzone/onboarding/main_onboarding.dart';


class LaucherPage extends StatefulWidget {
  @override
  _LauncherPageState createState() => new _LauncherPageState();
}

class _LauncherPageState extends State<LaucherPage> {
  @override
  void initState() {
    super.initState();
    startLaunching();
  }

  startLaunching() async {
    var duration = const Duration(seconds: 3);
    return new Timer(duration, () {
      Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (_) {
        return new Mainonboarding();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Image.asset(
          "assets/TripZone_logo.png",
          height: 200.0,
          width: 300.0,
        ),
      ),
    );
  }
}