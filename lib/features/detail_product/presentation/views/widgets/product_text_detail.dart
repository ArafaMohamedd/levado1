import 'package:flutter/material.dart';
import 'package:levado/core/Utils/colors.dart';
import '../../../../../Core/Utils/styles.dart';

class ProductTextDetail extends StatelessWidget {
  final String title;
  final String category;
  final String regularPrice;
  final String salePrice;
  final String description;

  const ProductTextDetail({
    Key? key,
    required this.title,
    required this.category,
    required this.regularPrice,
    required this.salePrice,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Styles.textStyle16.copyWith(color: AppColor.textBodyGre, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          category,
          style: Styles.textStyle20.copyWith(color: AppColor.textBodyColor, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Text(
              '$salePrice\$',
              style: Styles.textStyle30.copyWith(
                color: AppColor.textBodyGre,
                decoration: TextDecoration.lineThrough,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              '$regularPrice\$',
              style: Styles.textStyle30.copyWith(color: AppColor.textBodyRed),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          description,
          style: Styles.textStyle20.copyWith(color: AppColor.textBodyGre),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
