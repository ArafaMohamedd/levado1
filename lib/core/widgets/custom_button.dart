import 'package:flutter/material.dart';

import '../Utils/colors.dart';
import '../Utils/styles.dart';

class CustomButton extends StatelessWidget {
  final String? name;
  final TextStyle? textStyle;
  final VoidCallback onTap;
  final double? height;
  final double? width;

  CustomButton({
    Key? key,
    this.name,
    required this.onTap,
    this.textStyle,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double defaultHeight = MediaQuery.of(context).size.height * 0.07;
    final double defaultWidth = MediaQuery.of(context).size.width * 0.9;

    return Container(
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      height: height ?? defaultHeight,
      width: width ?? defaultWidth,
      child: TextButton(
        onPressed: onTap,
        child: Text(
          name ?? '',
          style: textStyle ?? Styles.textStyle25,
        ),
      ),
    );
  }
}