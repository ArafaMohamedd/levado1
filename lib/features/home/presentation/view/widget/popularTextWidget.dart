import 'package:flutter/material.dart';

import '../../../../../Core/Utils/colors.dart';
import '../../../../../Core/Utils/styles.dart';

class PopularTextWidget extends StatelessWidget{
  const PopularTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Text("Most Popular",
          style: Styles.textStyle20.copyWith(
              color: AppColor.primaryColor, fontWeight: FontWeight.w800)),
    );
  }
  
}