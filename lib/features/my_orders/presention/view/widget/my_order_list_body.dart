import 'package:flutter/material.dart';
import 'Bar_My_Orders.dart';
import 'ListOrders.dart';

class MyOrderListBody extends StatelessWidget{
  const MyOrderListBody({super.key,  });

  @override

  Widget build(BuildContext context) {
    return     const SingleChildScrollView(
      child: Column(
        children: [
      BarMyOrders(),
          ListOrders(),
        ],
      ),
    );

  }

}



