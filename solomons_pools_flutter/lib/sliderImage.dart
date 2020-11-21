import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  "assets/images/s1.jpg",
  "assets/images/s2.jpg",
  "assets/images/s3.jpg",
  "assets/images/s4.jpg",
  "assets/images/s5.jpg",
  "assets/images/s6.jpg",
  "assets/images/s7.jpg",
  "assets/images/s8.jpg",
];
final List<Widget> imageSliders = imgList
    .map(
      (item) => Container(
        child: Container(
          margin: EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
            child: Stack(
              children: <Widget>[
                Image.asset(
                  item,
                  fit: BoxFit.cover,
                  width: 1000.0,
                ),
              ],
            ),
          ),
        ),
      ),
    )
    .toList();

class ComplicatedImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              autoPlayInterval: Duration(
                seconds: 2,
              ),
              enlargeCenterPage: true,
            ),
            items: imageSliders,
          ),
        ],
      ),
    );
  }
}
