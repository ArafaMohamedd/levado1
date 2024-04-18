import 'package:flutter/material.dart';
import 'package:levado/Core/Utils/colors.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errorMessage;

  const CustomErrorWidget({super.key,  required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Icon(
            Icons.error,
            size: 50,
            color: AppColor.primaryColor,
          ),
          const SizedBox(height: 10),
            Text(
            'Error',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: AppColor.primaryColor),
          ),
          const SizedBox(height: 10,),
          Text(
            errorMessage,
            style:   TextStyle(fontSize: 16,color: AppColor.primaryColor),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
