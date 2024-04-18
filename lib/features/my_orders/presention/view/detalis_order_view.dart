import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:levado/features/my_orders/data/models/my_order_model.dart';

import '../../../../Core/Utils/colors.dart';
import '../../../../Core/Utils/styles.dart';

class OrderDetailsView extends StatelessWidget {
  final OrdersModel order;

  const OrderDetailsView({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(

        body: SingleChildScrollView(
           child: Padding(
             padding: const EdgeInsets.only(left: 10,right: 10),
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
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
                            "My orders",
                            style: Styles.textStyle25.copyWith(
                                color: AppColor.primaryColor, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 9,),
                Text('Order ID : ${order.oid}',style:  Styles.textStyle20.copyWith(color: AppColor.textBodyColor),),
                const SizedBox(height: 10),
                Text('Total : ${order.total}',style: Styles.textStyle20.copyWith(color: AppColor.textBodyColor),),
                Text('Order Status : ${order.orderStatus}',style:Styles.textStyle20.copyWith(color: AppColor.textBodyColor),),
                const SizedBox(height: 10),
                Text('Payment Status : ${order.paymentStatus}',style: Styles.textStyle20.copyWith(color: AppColor.textBodyColor),),
                const SizedBox(height: 20),
                Text('Items :', style: Styles.textStyle20.copyWith(color: AppColor.textBodyColor,fontWeight: FontWeight.bold),),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics() ,
                  shrinkWrap: true,
                  itemCount: order.orderItems.length,
                  itemBuilder: (context, index) {
                     return Container(
                       margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                       decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(8.0),
                         boxShadow: [
                           BoxShadow(
                             color: Colors.grey.withOpacity(0.5),
                             spreadRadius: 1,
                             blurRadius: 3,
                             offset: const Offset(0, 3), // changes position of shadow
                           ),
                         ],
                       ),
                       child: ListTile(
                        title: Text('Title :  ${order.orderItems[index].product.title}',style: Styles.textStyle20.copyWith(color: AppColor.primaryColor),),
                        subtitle: Text('price : ${order.orderItems[index].product.price} ',style: Styles.textStyle17.copyWith(color: AppColor.textBodyGre),),
                    ),
                     );
                  },
                ),
                const SizedBox(height: 20),
                // Add more order details as needed
              ],
          ),
           ),
        ),
      ),
    );
  }
}