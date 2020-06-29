import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:tripzone/onboarding/data/data.dart';
import 'package:tripzone/landingPage/landingPage_view.dart';



class Mainonboarding extends StatefulWidget {
  @override
  _MainonboardingState createState() => new _MainonboardingState();
}

class _MainonboardingState extends State<Mainonboarding> {

  List<SliderModel> slides = new List<SliderModel>();
  int currentIndex = 0;
  PageController pageController = new PageController(initialPage: 0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    slides = getSlides();
  }

  Widget pageIndexIndicator(bool iscurrentPage){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.0),
      height: iscurrentPage ? 10.0 : 6.0,
      width: iscurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: iscurrentPage ? Colors.grey : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        controller: pageController,
        itemCount: slides.length,
          onPageChanged: (val){
            setState(() {
              currentIndex = val;
            });
          },
          itemBuilder: (context, index){
            return SliderTile(
             imageAssetsPath: slides[index].getImageAssetPath(),
              title: slides[index].getTitle(),
              desc: slides[index].getDesc(),
            );
          }),
      bottomSheet: currentIndex != slides.length -1 ? Container(
        height: Platform.isAndroid ? 70 : 60,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                pageController.animateToPage(slides.length - 1, duration: Duration(milliseconds: 400), curve: Curves.linear);
              },
                child: Text("SKIP", style: TextStyle(
                  color: Color(0xff1499d1),
                  fontFamily: "Poppins",
                  fontSize: 16,
                ),),
            ),
            Row(
              children: <Widget>[
                for(int i = 0; i < slides.length; i++ ) currentIndex == i ?pageIndexIndicator(true) : pageIndexIndicator(false)
              ],
            ),
            GestureDetector(
              onTap: () {
                pageController.animateToPage(currentIndex + 1, duration: Duration(milliseconds: 400), curve: Curves.linear);
              },
              child: Text("NEXT", style: TextStyle(
                color: Color(0xff1499d1),
                fontFamily: "Poppins",
                fontSize: 16,
              ),),
            ),
          ],
        ),
      ) : GestureDetector(
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: 70,
          child: Text("LET'S GO!", style: TextStyle(
            color: Color(0xff1499d1),
            fontFamily: "Poppins",
            fontSize: 16,
          ),
          ),
        ),
        onTap: () {
          Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (context){
            return new LandingPage();
          }));
        },
      ),
    );
  }
}

class SliderTile extends StatelessWidget {
  String imageAssetsPath, title, desc;
  SliderTile({this.imageAssetsPath, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(imageAssetsPath,
            height: 250.0,
          ),
          SizedBox(height: 50,),
          Text(title, style: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600,
            fontSize: 23,
            color:Color(0xff1499d1),
          ),),
          SizedBox(height: 12,),
          Text(desc, textAlign: TextAlign.center ,style: TextStyle(
                fontFamily: "Poppins",fontWeight: FontWeight.w300,
                fontSize: 13,
                color:Color(0xff707070),
          ),)
        ],
      ),
    );
  }
}