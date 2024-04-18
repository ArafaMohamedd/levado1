 import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TopCategoriesWidget extends StatelessWidget{
  const TopCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> listImage =[
     "assets/images/download (1).jpg",
     "assets/images/download (2).jpg",
      "assets/images/download.jpg"

    ];
     return CarouselSlider(
      options: CarouselOptions(
        height: 180,
        viewportFraction: 1.0,
        autoPlay: true,
        enlargeCenterPage: false,
      ),
      items: listImage.map((e) => Image.asset(
        e,
        fit: BoxFit.cover,
        width: double.infinity,
        height: 180,
        alignment: Alignment.center,
      )).toList(),
    );

  }

}