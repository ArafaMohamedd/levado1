import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../../../Core/Utils/colors.dart';

class SliderImage extends StatelessWidget {
  const SliderImage({
    super.key,
    required this.listImage,
  });

  final List<String> listImage;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height:300,
        viewportFraction: 1.0,
        autoPlay: true,
        enlargeCenterPage: false,
      ),
      items: listImage.map((e) =>
          Padding(
            padding: const EdgeInsets.all(50),
            child: CachedNetworkImage(
              imageUrl: e,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  SizedBox(
                      height: 30,
                      child: CircularProgressIndicator(value: downloadProgress.progress,)),
              errorWidget: (context, url, error) =>   Icon(Icons.error,color: AppColor.primaryColor,),
            ),
          )
      ).toList(),
    );
  }
}
