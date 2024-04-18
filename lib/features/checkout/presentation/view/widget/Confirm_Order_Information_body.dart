import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:levado/core/Utils/app_router.dart';
import 'package:levado/core/widgets/error_widget.dart';

import '../../../../../Core/widgets/custom_button.dart';
import '../../view_model/information_order_data_cubit/information_order_data_cubit.dart';
import 'conformation_order_Item.dart';


class ConfirmOrderInformationBody extends StatelessWidget{
    ConfirmOrderInformationBody({super.key,required this.oid});
String oid;
  @override
  Widget build(BuildContext context) {
     return  BlocBuilder<InformationOrderDataCubit, InformationOrderDataState>(
         builder: (context, state) {
       if (state is InformationOrderDataSuccess) {
         final informationOrder = state.informationOrder;
         return   SingleChildScrollView(
       child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             ConformationOrderItem(title: 'sub total', data: informationOrder.subTotal,),
             ConformationOrderItem(title: 'shipping amount', data:informationOrder.shippingAmount ,),
             ConformationOrderItem(title: 'tax fee', data:informationOrder.taxFee,),
             ConformationOrderItem(title: 'service fee', data: informationOrder.serviceFee,),
             ConformationOrderItem(title: 'total', data: informationOrder.total,),
             ConformationOrderItem(title: 'payment status', data: informationOrder.paymentStatus,),
             ConformationOrderItem(title: 'order status', data: informationOrder.orderStatus,),
             ConformationOrderItem(title: 'full nam', data: informationOrder.fullName,),
             ConformationOrderItem(title: 'email', data:  informationOrder.email,),
             ConformationOrderItem(title: 'mobile', data: informationOrder.mobile,),
             ConformationOrderItem(title: 'address', data: informationOrder.address,),
             ConformationOrderItem(title: 'city', data: informationOrder.city,),
             ConformationOrderItem(title: 'state', data: informationOrder.state,),
             ConformationOrderItem(title: 'country', data:informationOrder.country,),
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 10),
               child: CustomButton(
                 name: "Conformation",
                 onTap: () {
                   context.push(AppRouter.kCouponView,extra:oid );
                   },

  ),
             )

           ],
         ),
       ),
     );
       } else if (state is InformationOrderDataFailure) {
         print(state.errMessage);
         return  const CustomErrorWidget(errorMessage: 'NO Data',);
       } else {
         return const Center(child: CircularProgressIndicator());
       }
         },
     );
  }
}
