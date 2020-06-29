import 'package:tripzone/notifier/destinasion_notifier.dart';
import 'package:tripzone/models/destinasion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

getDestinasions(DestinasionNotifier destinasionNotifier) async{
  QuerySnapshot snapshot = await Firestore.instance.collection('destinasion').getDocuments();

  List<Destinasion> _destinasionList = [];

  snapshot.documents.forEach((document){
    Destinasion destinasion = Destinasion.fromMap(document.data);
    _destinasionList.add(destinasion);
  });

  destinasionNotifier.destinasionList = _destinasionList;
}