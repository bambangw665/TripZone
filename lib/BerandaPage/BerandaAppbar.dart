import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tripzone/constant.dart';

class TripzoneAppBar extends AppBar {
  TripzoneAppBar()
      : super(
            elevation: 0.0,
            backgroundColor: TripzonePalette.appbar,
            flexibleSpace: _buildTripzoneAppBar());

  static Widget _buildTripzoneAppBar() {
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: TripzonePalette.appbar,
        leading: IconButton(
            icon: Image.asset(
              'assets/logo_white_tripzone.png',
              height: 32.0,
            ),
            onPressed: () {
              // navigasi untuk img logo
            }),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "TripZone",
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w700,
                color: Color(0xffffffff),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
