import 'package:flutter/cupertino.dart';
import 'package:tripzone/models/destinasion.dart';
import 'dart:collection';

class DestinasionNotifier with ChangeNotifier {
 List<Destinasion> _destinasionList = [];
 Destinasion _currentDestinasion;

 UnmodifiableListView<Destinasion> get destinasionList => UnmodifiableListView(_destinasionList);

 Destinasion get currentDestinasion => _currentDestinasion;

  set destinasionList(List<Destinasion> destinasionList){
    _destinasionList = destinasionList;
    notifyListeners();
  }

  set currentDestinasion(Destinasion destinasion){
   _currentDestinasion = destinasion;
   notifyListeners();
 }
}