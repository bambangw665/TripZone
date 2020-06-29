import 'package:flutter/material.dart';
// import 'package:tripzone/models/destination_model.dart';
import 'package:tripzone/models/destinasion.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tripzone/destinasi/gotoMaps.dart';




class DestinationScreen extends StatefulWidget {
  final Destinasion destination;
  DestinationScreen({this.destination});

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {


  @override
  Widget build(BuildContext context) {
    // print(widget.destination.large_text);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Hero(
                  tag: widget.destination.image_url,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image(
                      image: NetworkImage(widget.destination.image_url),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      iconSize: 30.0,
                      color: Colors.white,
                      onPressed: () => Navigator.pop(context),
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: Image.asset('assets/logo_white_tripzone.png'),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 20.0,
                bottom: 20.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.destination.nama_destinasi,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.locationArrow,
                          size: 15.0,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          widget.destination.kota,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 20.0,
                bottom: 20.0,
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.location_on),
                    iconSize: 25.0,
                    color: Colors.white,
                    onPressed: () {
                      Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (context){
                        return new GotoMaps(destination: widget.destination);
                      }));
                    },
                  ),
                ],
              ),
              ),
            ],
          ),
        ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          primary: false,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.destination.nama_destinasi,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                    maxLines: 2,
                    textAlign: TextAlign.left,
                  ),
                ),

                IconButton(
                  icon: Icon(
                    Icons.bookmark,
                  ),
                  onPressed: (){},
                ),
              ],
            ),

            Row(
              children: <Widget>[
                Icon(
                  Icons.location_on,
                  size: 14,
                  color: Colors.blueGrey[300],
                ),

                SizedBox(width: 3),

                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.destination.kota,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.blueGrey[300],
                    ),
                    maxLines: 1,
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.destination.price_idr,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
                maxLines: 1,
                textAlign: TextAlign.left,
              ),
            ),

            SizedBox(height: 40),

            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Deskripsi : ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                maxLines: 1,
                textAlign: TextAlign.left,
              ),
            ),

            SizedBox(height: 10),

            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.destination.large_text,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                ),
                textAlign: TextAlign.left,
              ),
            ),

            SizedBox(height: 10),
          ],
        )
        ],
      ),
    );
  }
}
