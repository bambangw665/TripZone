//import 'package:flutter/material.dart';
class SliderModel{

  String imagePath;
  String title;
  String desc;

  SliderModel({this.imagePath, this.title, this.desc});

  void setImageAssetPath(String getImagePath){
    imagePath = getImagePath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imagePath;
  }

  String getTitle(){
    return title;
  }

  String getDesc(){
    return desc;
  }
}

List<SliderModel> getSlides(){

  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel =  new SliderModel();

//  1
  sliderModel.setImageAssetPath("assets/illustration1_siappergi.png");
  sliderModel.setTitle("Siap Untuk Berpergian");
  sliderModel.setDesc("Temukan informasi dan tentukan serta akses tenmpat wisata yang kamu inginkan dengan mudah");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

//  2
  sliderModel.setImageAssetPath("assets/illustration2_informasi.png");
  sliderModel.setTitle("Informasi Yang Akurat");
  sliderModel.setDesc("Dengan informasi yang akurat anda dapat mengetahui lokasi wisata yang anda tuju");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

//  3
  sliderModel.setImageAssetPath("assets/illustration3_nikmati.png");
  sliderModel.setTitle("Nikmati Perjalananmu");
  sliderModel.setDesc("Nikmati perjalanan anda dengan pengalaman yang belum ada sebelumnya");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}