import 'package:flutter/material.dart';
import 'package:tripzone/models/destination_model.dart';
import 'package:tripzone/destinasi/destination_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'package:tripzone/notifier/destinasion_notifier.dart';
import 'package:provider/provider.dart';
import 'package:tripzone/api/destinasion_api.dart';
import 'package:tripzone/models/destinasion.dart';

class DestinationCarousel2 extends StatefulWidget {
  @override
  _DestinationCarousel2State createState() => _DestinationCarousel2State();
}

class _DestinationCarousel2State extends State<DestinationCarousel2> {
   @override
  void initState() {
    DestinasionNotifier destinasionNotifier = Provider.of<DestinasionNotifier>(context, listen:false);
    getDestinasions(destinasionNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     DestinasionNotifier destinasionNotifier = Provider.of<DestinasionNotifier>(context);

    return Column(
      children: <Widget>[
        Container(
          height: 300.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: destinasionNotifier.destinasionList.length,
            itemBuilder: (BuildContext context, int index) {
              Destinasion destination = destinasionNotifier.destinasionList[index];

              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DestinationScreen(
                      destination: destination,
                    ),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  width: 210.0,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Positioned(
                        bottom: 15.0,
                        child: Container(
                          height: 120.0,
                          width: 200.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
//                                Text(
////                                  '${destination.activities.length} activities',
////                                  style: TextStyle(
////                                    fontSize: 22.0,
////                                    fontWeight: FontWeight.w600,
////                                    letterSpacing: 1.2,
////                                  ),
////                                ),
                                Text(
                                  destination.description,
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0.0, 2.0),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: Stack(
                          children: <Widget>[
                            Hero(
                              tag: destination.image_url,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image(
                                  height: 180.0,
                                  width: 180.0,
                                  image: NetworkImage(destination.image_url),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 10.0,
                              bottom: 10.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    destination.nama_destinasi,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        FontAwesomeIcons.locationArrow,
                                        size: 10.0,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 5.0),
                                      Text(
                                        destination.kota,
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
