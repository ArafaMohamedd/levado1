import 'package:flutter/material.dart';

import '../../../../../Core/Utils/colors.dart';
import '../../../../../Core/Utils/styles.dart';

class ConformationOrderItem extends StatelessWidget {
  String title;
  String data;
  ConformationOrderItem({
    required this.title,
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: Styles.textStyle25.copyWith(color: AppColor.primaryColor),),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: AppColor.backItemColor,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(data, style: Styles.textStyle25),
            ),
          ),
        ),

      ],
    );
  }
}