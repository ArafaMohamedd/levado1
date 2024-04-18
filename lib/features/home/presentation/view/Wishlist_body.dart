import 'package:flutter/material.dart';
import 'package:levado/core/Utils/colors.dart';
import 'package:levado/features/home/presentation/view/widget/listWishlistWidget.dart';

import '../../../../Core/Utils/styles.dart';

class WishlistBody extends StatelessWidget {
  const WishlistBody({super.key});

  @override
  Widget build(BuildContext context) {
 return  SingleChildScrollView(

   child: Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: [
       Padding(
         padding:   EdgeInsets.only(left: 10, top: 15),
         child: Container(
           color: Colors.transparent,
           child: Text(
             "MY Favorite",
             style: Styles.textStyle25.copyWith(
                 color: AppColor.primaryColor, fontWeight: FontWeight.bold),
           ),
         ),
       ),
       const SizedBox(height: 10),
       const ListWishlistWidget( ),
       const SizedBox(height: 10),
     ],
   ),
 );
  }

}