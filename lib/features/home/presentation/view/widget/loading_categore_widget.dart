import 'package:flutter/material.dart';
import 'package:levado/Core/Utils/colors.dart';
import 'package:shimmer/shimmer.dart';

class LoadingCategoryWidget extends StatelessWidget {
  const LoadingCategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: 100,

      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (ctx, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: AppColor.primaryColor,
            child: Container(
              margin: const EdgeInsets.all(15),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10), // Add border radius here
              ),
            ),
          );
        },
      ),
    );
  }
}
