import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:levado/core/Utils/app_router.dart';
import 'package:levado/core/widgets/error_widget.dart';
import 'package:levado/features/my_orders/presention/view_model/get_my_order_cubit/get_my_order_cubit.dart';
import '../../../../../Core/Utils/colors.dart';
import '../../../../../Core/Utils/styles.dart';
class ListOrders extends StatelessWidget {
  const ListOrders({
    super.key,
  });
   @override
  Widget build(BuildContext context) {
    return  BlocBuilder<GetMyOrderCubit, GetMyOrderState>(
        builder: (context, state) {
      if (state is GetMyOrderSuccess) {
        final allOrder = state.allOrder;
        return ListView.builder(
        itemCount: allOrder.length,
         shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics() ,
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
          title: Text(
            'Order ID : ${allOrder[index].oid} ',
            style:  Styles.textStyle20.copyWith(color: AppColor.textBodyColor, )
          ),
             subtitle: Text(
            'Total: ${allOrder[index].total}  ',
            style: Styles.textStyle17.copyWith(color: AppColor.textBodyGre),
          ),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {

    context.push(AppRouter.kOrderDetailsView,extra:allOrder[index]);
           },
        ),
      );
        }
        );
      } else if (state is GetMyOrderFailure) {
        return const Center(child: CustomErrorWidget(errorMessage: 'Failed to load data. Please try again later.', key: null,));

      } else {
        return   const Center(child:  CircularProgressIndicator());
      }
        },
    );
  }
}
