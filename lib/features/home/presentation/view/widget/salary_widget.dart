import 'package:flutter/material.dart';
import 'package:levado/Core/Utils/styles.dart';
import 'package:levado/core/Utils/colors.dart';

class SalaryWidget extends StatelessWidget {
  const SalaryWidget({
    super.key,
    required double minPrice,
    required double maxPrice,
  }) : _minPrice = minPrice, _maxPrice = maxPrice;

  final double _minPrice;
  final double _maxPrice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              _minPrice.toStringAsFixed(1),
              style:  Styles.textStyle17.copyWith(color: AppColor.textBodyColor)
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              _maxPrice.toStringAsFixed(1),
              style: Styles.textStyle17.copyWith(color: AppColor.textBodyColor)
            ),
          )
        ],
      ),
    );
  }
}
