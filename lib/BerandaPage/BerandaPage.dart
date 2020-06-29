import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tripzone/widgets/destination_carousel.dart';
import 'package:tripzone/BerandaPage/BerandaAppbar.dart';



final List<String> imgList = [
  'https://images.pexels.com/photos/1081915/pexels-photo-1081915.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
  'https://images.pexels.com/photos/1555581/pexels-photo-1555581.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
  'https://images.pexels.com/photos/2020382/pexels-photo-2020382.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
];


final List<Widget> imageSliders = imgList
    .map((item) => Container(
  child: Container(
    child: ClipRRect(
        borderRadius: new BorderRadius.vertical(
          //berder radius for img caoursel
            bottom: new Radius.circular(20.0)),
        child: Stack(
          children: <Widget>[
            Image.network(
              item,
              fit: BoxFit.cover,
              width: 1000.0,
              scale: 1000.0,
            ),
            Positioned(
              child: Container(
                constraints: BoxConstraints.expand(height: 300),
                padding: EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 20.0),
                child: Center(
                  child: Text(
                    'Banyumas',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )),
  ),
))
    .toList();


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: TripzoneAppBar(),
      body: new Container(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            new Container(
              child: Column(
                children: [
                  _buildCarouselColumn(),
                ],
              ),
            ),
            new Container(
//              padding: EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 16.0),
              child: new Column(
                children: <Widget>[
                  SizedBox(height: 20.0),
                  DestinationCarousel(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCarouselColumn() {
    return new Column(children: [
      CarouselSlider(
        items: imageSliders,
        options: CarouselOptions(
          // height: 2000.0,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
      // dots
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imgList.map((url) {
          int index = imgList.indexOf(url);
          return Container(
            width: 8.0,
            height: 8.0,
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _current == index
              // dots colors
                  ? Color.fromRGBO(0, 0, 0, 0.9)
                  : Color.fromRGBO(0, 0, 0, 0.4),
            ),
          );
        }).toList(),
      ),
      // Loading screen
    ]);
  }

}
