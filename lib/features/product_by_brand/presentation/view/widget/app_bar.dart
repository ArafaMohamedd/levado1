import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:levado/Core/Utils/colors.dart';
import 'package:levado/Core/Utils/styles.dart';

class CustomAppBarBrandProduct extends StatelessWidget {
  CustomAppBarBrandProduct({super.key, required this.brand});
  String brand;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2, top: 15),
      child: Container(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(onPressed:  (){
         context.pop();
            }, icon:    Icon(Icons.arrow_back,color: AppColor.primaryColor,size: 32,)),
            const SizedBox(width: 50,),
            Center(
              child: Text(
                "Brand $brand",
                style: Styles.textStyle25.copyWith(
                    color: AppColor.primaryColor, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
