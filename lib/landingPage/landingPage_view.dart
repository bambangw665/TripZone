import 'package:flutter/material.dart';
import 'package:tripzone/constant.dart';
import 'package:tripzone/BerandaPage/BerandaPage.dart';
import 'package:tripzone/DaftarTempat/main_daftar_tempat.dart';
//import 'package:tripzone_rev2/destinasi/destination_screen.dart'
import 'package:tripzone/maps/main_maps.dart';


class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => new _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _buttomNavCurrentIndex = 0;
  List<Widget> _container = [
    new HomeScreen(),
    new DaftarTempat(),
    new MainMaps(),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: _container[_buttomNavCurrentIndex],
        bottomNavigationBar: _buildBottomNavigation());
  }

  Widget _buildBottomNavigation() {
    return new BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          _buttomNavCurrentIndex = index;
        });
      },
      currentIndex: _buttomNavCurrentIndex,
      items: [
        BottomNavigationBarItem(
          activeIcon: new Icon(
            Icons.home,
            color: TripzonePalette.appbar,
          ),
          icon: new Icon(
            Icons.home,
            color: Colors.grey,
          ),
          title: new Text(
            'Home',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        BottomNavigationBarItem(
          activeIcon: new Icon(
            Icons.map,
            color: TripzonePalette.appbar,
          ),
          icon: new Icon(
            Icons.map,
            color: Colors.grey,
          ),
          title: new Text(
            'List Wisata',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        BottomNavigationBarItem(
          activeIcon: new Icon(
            Icons.location_on,
            color: TripzonePalette.appbar,
          ),
          icon: new Icon(
            Icons.location_on,
            color: Colors.grey,
          ),
          title: new Text(
            'lokasi',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
