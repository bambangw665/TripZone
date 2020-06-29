import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tripzone/landingPage/landingPage_view.dart';
import 'package:tripzone/models/destination_model.dart';

class MainMaps extends StatefulWidget {
  final Destination destination;

  MainMaps({this.destination});
  
  
  @override
  MainMapsState createState() => MainMapsState();
}

class MainMapsState extends State<MainMaps> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
  }
  double zoomVal=5.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Stack(
        children: <Widget>[
          _buildGoogleMap(context),
          _zoomminusfunction(),
          _zoomplusfunction(),
          _buildContainer(),
        ],
      ),
    );
  }

  Widget _zoomminusfunction() {

    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
          icon: Icon(FontAwesomeIcons.searchMinus,color:Colors.blue),
          onPressed: () {
            zoomVal--;
            _minus( zoomVal);
          }),
    );
  }
  Widget _zoomplusfunction() {

    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
          icon: Icon(FontAwesomeIcons.searchPlus,color:Colors.blue),
          onPressed: () {
            zoomVal++;
            _plus(zoomVal);
          }),

    );
  }

  Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(-7.3006383, 109.2184479), zoom: zoomVal)));
  }
  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(-7.3006383, 109.2184479), zoom: zoomVal)));
  }


  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://backpackerjakarta.com/wp-content/uploads/2016/07/Curug-Telu-baturaden-purwokerto.jpg",
                  -7.319880,109.241970,"Curug Telu",'4,4'),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://dolanyok.com/wp-content/uploads/Camp-Area-qiqiandini.jpg",
                  -7.316180,109.241697,"Camp Area Umbul Bengkok",'4,3'),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://i.ytimg.com/vi/SY4VioWwMzk/maxresdefault.jpg",
                  -7.336739,109.136508,"Air Terjun Cipedok",'4,2'),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://www.jejakpiknik.com/wp-content/uploads/2018/05/Screenshot_97-1-630x380.jpg",
                  -7.305693,109.242428,"Telaga Sunyi",'4,1'),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://www.mongabay.co.id/wp-content/uploads/2019/06/3-Suasana-sejuk-kawasan-hutan-pinus-LImpakuwus.jpg",
                  -7.307477,109.243820,"H Pinus Limpakuwus",'4,0'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxes(String _image, double lat,double long,String destinasiName, String rating) {
    return  GestureDetector(
      onTap: () {
        _gotoLocation(lat,long);
      },
      child:Container(
        child: new FittedBox(
          child: Material(
              color: Colors.white,
              elevation: 14.0,
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: Color(0x802196F3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 180,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(24.0),
                      child: Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(_image),
                      ),
                    ),),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: myDetailsContainer1(destinasiName),
                    ),
                  ),

                ],)
          ),
        ),
      ),
    );
  }

  Widget myDetailsContainer1(String destinasiName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(destinasiName,
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              )),
        ),
      ],
    );
  }

  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:  CameraPosition(target: LatLng(-7.3006383, 109.2184479), zoom: 12),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          cTeluMarker,campMaker,cipedokMaker,sunyiMaker,pinusMaker,
        },
      ),
    );
  }

  Future<void> _gotoLocation(double lat,double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat, long), zoom: 15,tilt: 50.0,
      bearing: 45.0,)));
  }
}

Marker cTeluMarker = Marker(
  markerId: MarkerId('Curug 3'),
  position: LatLng(-7.319880,109.241970),
  infoWindow: InfoWindow(title: 'Curug Telu'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueBlue,
  ),
);

Marker campMaker = Marker(
  markerId: MarkerId('Camp'),
  position: LatLng(-7.316180,109.241697),
  infoWindow: InfoWindow(title: 'Camp Area'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueBlue,
  ),
);
Marker cipedokMaker = Marker(
  markerId: MarkerId('Cipedok'),
  position: LatLng(-7.336739,109.136508),
  infoWindow: InfoWindow(title: 'Waterfall Cipedok'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueBlue,
  ),
);

//New York Marker

Marker sunyiMaker = Marker(
  markerId: MarkerId('sunyi'),
  position: LatLng(-7.305693,109.242428),
  infoWindow: InfoWindow(title: 'Telaga Sunyi'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueBlue,
  ),
);
Marker pinusMaker = Marker(
  markerId: MarkerId('pinus'),
  position: LatLng(-7.307477,109.243820),
  infoWindow: InfoWindow(title: 'H Pinus Limpakuwus'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueBlue,
  ),
);
