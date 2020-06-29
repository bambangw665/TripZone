import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tripzone/landingPage/landingPage_view.dart';
import 'package:tripzone/models/destination_model.dart';
import 'package:tripzone/constant.dart';
import 'package:tripzone/widgets/destination_carousel2.dart';




class DaftarTempat extends StatefulWidget {
  final Destination destination;

  DaftarTempat({this.destination});

  @override
  _DaftarTempatState createState() => _DaftarTempatState();
}

class _DaftarTempatState extends State<DaftarTempat> {
  final TextEditingController _searchControl = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: TripzonePalette.appbar,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (context){
              return new LandingPage();
            }));
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Daftar Tempat",
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w700,
                color: Color(0xffffffff),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Image.asset('assets/logo_white_tripzone.png'),
            onPressed: () {
              Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (context){
                return new LandingPage();
              }));
            },
          ),
        ],
      ),
      body:  ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Mau Kemana \nhari ini?",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey[50],
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: TextField(
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.blueGrey[300],
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintText: "Banyumas . . . . ",
                  prefixIcon: Icon(
                    Icons.location_on,
                    color: Colors.blueGrey[300],
                  ),
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.blueGrey[300],
                  ),
                ),
                maxLines: 1,
                controller: _searchControl,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 50,),
            height: 500,
            width: 500,
            child: DestinationCarousel2(),
          ),
        ],
      ),
    );
  }
}
