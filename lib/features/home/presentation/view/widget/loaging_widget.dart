import 'package:flutter/material.dart';
import 'package:levado/Core/Utils/colors.dart';
import 'package:shimmer/shimmer.dart';

class LoadingWidget extends StatelessWidget {
      const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: MediaQuery.of(context).size.height, // Set height as needed
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 20.0,
        ),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: width / 1.1,
            height: width / 1.3,
            child: Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: AppColor.primaryColor,
              child: Container(
                margin: const EdgeInsets.all(10),
                width: width / 1.1,
                height: width / 1.3,
                decoration: BoxDecoration(
                   color: AppColor.backItemColor,
                ),
                child: Center(),
              ),
            ),
          );
        },
      ),
    );
  }
}
