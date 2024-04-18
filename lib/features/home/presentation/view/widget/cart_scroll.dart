import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:levado/Core/Utils/colors.dart';
import 'package:levado/Core/Utils/styles.dart';
import 'package:levado/core/Utils/app_router.dart';
import 'package:levado/core/widgets/error_widget.dart';
import 'package:levado/features/home/presentation/view_models/delete_cart_cubit/delete_cart_cubit.dart';
import 'package:levado/features/home/presentation/view_models/get_cart_cubit/get_cart_cubit.dart';
 import '../../../data/models/order_model.dart';
import '../../view_models/get_cart_summary_cubit/get_cart_summary_cubit.dart';
import 'cart_item.dart';

class CartScroll extends StatelessWidget {
  const CartScroll({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrderModel? orderModel;
     return   BlocBuilder<GetCartCubit, GetCartState>(
        builder: (context, state) {
      if (state is GetCartSuccess) {
        BlocProvider.of<GetCartSummaryCubit>(context).getSummaryCart();

        final  cart = state.allCart;
        return BlocConsumer<GetCartSummaryCubit, GetCartSummaryState>(
            listener: (context, state) {
              if (state is GetCartSummarySuccess) {
                  orderModel= state.allSummaryCart;
               }

            },
            builder: (context, state) {
              return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(
                height: 5,
              ),
              ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: cart.length,
                itemBuilder: (_, index) {
                  return Dismissible(
                    key: UniqueKey(),
                    onDismissed: (value) {

                      BlocProvider.of<DeleteCartCubit>(context).deleteCartProduct("${cart[index].id}");
                      BlocProvider.of<GetCartCubit>(context).getCart();

                     },
                    background: Container(
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Icon(
                        Icons.delete_outline,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    child:   CartItem(
                      cartItemModel:  cart[index],

                    ),
                  );
                },
              ),

              const SizedBox(
                height: 30,
              ),
               Row(
                children: [
                  Text(
                    "shipping",
                    style: Styles.textStyle20
                        .copyWith(color: AppColor.textBodyColor),
                  ),
                  const Spacer(),
                  Text(
                    "${orderModel?.shipping ?? ''}",
                    style: Styles.textStyle20
                        .copyWith(color: AppColor.textBodyColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "serviceFee",
                    style: Styles.textStyle20
                        .copyWith(color: AppColor.textBodyColor),
                  ),
                  const Spacer(),
                  Text(
                    "${orderModel?.serviceFee?? ''}",
                    style: Styles.textStyle20
                        .copyWith(color: AppColor.textBodyColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "tax",
                    style: Styles.textStyle20
                        .copyWith(color: AppColor.textBodyColor),
                  ),
                  const Spacer(),
                  Text(
                    "${orderModel?.tax?? ''}",
                    style: Styles.textStyle20
                        .copyWith(color: AppColor.textBodyColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "subTotal",
                    style: Styles.textStyle20
                        .copyWith(color: AppColor.textBodyColor),
                  ),
                  const Spacer(),
                  Text(
                    "${orderModel?.subTotal?? ''}",
                    style: Styles.textStyle20
                        .copyWith(color: AppColor.textBodyColor),
                  ),
                ],
              ),






            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: Row(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Total :",
                      style: Styles.textStyle17
                          .copyWith(color: AppColor.textBodyColor)),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                      "${orderModel?.total ?? ''}",
                    style: Styles.textStyle20.copyWith(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: AppColor.primaryColor,
                      textStyle: Styles.textStyle20),
                  onPressed: () {
                    context.push(AppRouter.kCreateOrderView);
                   },
                  child: const Text('Checkout'),
                ),
              ),
            ],
          ),
        ),
      ),);

            });}
      else if (state is GetCartFailure) {
        print(state.errMessage);
        return const Center(child: CustomErrorWidget(errorMessage: 'Failed to load data. Please try again later.', key: null,));
      }else {
        return const Center(child: CircularProgressIndicator());
      }
        },
    );
  }
}
