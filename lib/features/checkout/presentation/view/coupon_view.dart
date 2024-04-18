import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:levado/core/Utils/api_service.dart';
import 'package:levado/features/checkout/data/repos/Pay_Repos/pay_repo_imp.dart';
import 'package:levado/features/checkout/data/repos/coupon_Repos/coupon_repo_imp.dart';
import 'package:levado/features/checkout/presentation/view/widget/coupon_body.dart';
import 'package:levado/features/checkout/presentation/view_model/coupon_cubit/coupon_cubit.dart';
import 'package:levado/features/checkout/presentation/view_model/pay_cubit/pay_cubit.dart';

class CouponView extends StatelessWidget {
  CouponView({super.key, required this.oid});
  String oid;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CouponCubit(CouponRepoImp(ApiService(Dio()))),
          ),
          BlocProvider(
            create: (context) => PayCubit(PayRepoImp(ApiService(Dio()))),
          ),

        ],
        child: SafeArea(
            child: Scaffold(
          body: CouponBody(
            oid: oid,
          ),
        )));
  }
}
