import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:levado/Core/Utils/colors.dart';
import 'package:levado/Core/Utils/styles.dart';
import 'package:levado/core/Utils/app_router.dart';
import 'package:levado/core/widgets/custom_textformfield.dart';
import 'package:levado/features/checkout/presentation/view_model/coupon_cubit/coupon_state.dart';
import 'package:levado/features/checkout/presentation/view_model/pay_cubit/pay_cubit.dart';
import 'package:levado/features/checkout/presentation/view_model/pay_cubit/pay_state.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../Core/widgets/Show_Snackbar.dart';
import '../../../../../Core/widgets/custom_button.dart';
import '../../../../../core/widgets/url_lancher_widget.dart';
import '../../view_model/coupon_cubit/coupon_cubit.dart';

class CouponBody extends StatelessWidget{
    CouponBody({super.key,required this.oid});
String  oid;
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    String ? coupon;
    final couponController = TextEditingController();
     bool isLoading = false;
    return  BlocConsumer<CouponCubit, CouponState>(
        listener: (context, state) {
      if (state is CouponLoading) {
        isLoading = true;
      } else if (state is CouponSuccess) {
      //context.push(AppRouter.kPayStripeView,extra: oid);
        isLoading = false;
        showSnackBar(context,state.ms);
     BlocProvider.of<PayCubit>(context).pay(oid);


      }else if(state is CouponFailure){
        isLoading = false;
        showSnackBar(context, state.errMessage);

      }
    },
        builder:(context,state) {


   return  BlocConsumer<PayCubit, PayState>(

       listener: (context, state) async {
     if (state is PayLoading) {
       isLoading = true;
     } else if (state is PaySuccess) {

       String url = state.ms;
       launchCustomUr(context, url);
       isLoading = false;
     } else if (state is PayFailure) {
       isLoading = false;
       showSnackBar(context, state.errMessage);
     }
   }
       ,builder:  (context,state)=>   ModalProgressHUD(
              inAsyncCall: isLoading,
              child: Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  children: [

                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          "Coupons",
                          style: Styles.textStyle30.copyWith(
                              color: AppColor.primaryColor),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 3,
                        child: Image.asset("assets/images/coupon.png")),
                    const Expanded(child: SizedBox()),

                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: AppTextFormField(
                          keyboardType: TextInputType.text,
                          ctrl: couponController,
                          validator: (data) {
                            if (data!.isEmpty) {
                              return 'Please enter some text';
                            }
                          },
                          onFieldSubmitted: (value) {
                            coupon = value;
                          },
                          prefixIcon: const Icon(Icons.card_giftcard),
                          hintText: "Coupon",
                          label: const Text("Coupon"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: CustomButton(
                        name: "Send coupon",
                        onTap: () {
                          if (formKey.currentState?.validate() == true) {
                            coupon = couponController.text;
                            BlocProvider.of<CouponCubit>(context).coupon(
                                coupon!, oid);
                          }
                        },
                      ),
                    ),
                    const Expanded(child: SizedBox()),

                       Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: CustomButton(
                          name: "No coupon",
                          onTap: () {
                            BlocProvider.of<PayCubit>(context).pay(oid);
                          },
                        ),

                      ),

                    const Expanded(
                        flex: 5,
                        child: SizedBox())
                  ],
                ),
              )
          )
   );} );
  }

}