import 'package:flutter/material.dart';
import 'package:tripzone/launcher/launcher_view.dart';
import 'package:provider/provider.dart';
import 'package:tripzone/notifier/destinasion_notifier.dart';


void main() => runApp(
  ChangeNotifierProvider(
    create: (context) => DestinasionNotifier(),
    child:MyApp()
  ),
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TripZone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF3EBACE),
        accentColor: Color(0xFFD8ECF1),
        scaffoldBackgroundColor: Color(0xFFF3F5F7),
      ),
      home: LaucherPage(),
    );
  }
}