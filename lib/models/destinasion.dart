import 'package:cloud_firestore/cloud_firestore.dart';

class Destinasion {
  String id;
  String nama_destinasi;
  String kota;
  String large_text;
  String description;
  String latitude;
  String longitude;
  String price_idr;
  String rating;
  String image_url;

  Destinasion.fromMap(Map<String, dynamic> data){
    id = data['id'] ;
    nama_destinasi = data['nama_destinasi'];
    kota = data['kota'];
    large_text = data['large_text'];
    description = data['description'];
    latitude = data['latitude'];
    longitude = data['longitude'];
    price_idr = data['price_idr'];
    rating = data['rating'];
    image_url = data['image_url'];
    }
}