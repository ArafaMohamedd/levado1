import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:levado/core/Utils/api_service.dart';
import 'package:levado/features/my_orders/data/repos/get_My_orders_Repos/get_my_order_implemntaion.dart';
import 'package:levado/features/my_orders/presention/view/widget/my_order_list_body.dart';
import 'package:levado/features/my_orders/presention/view_model/get_my_order_cubit/get_my_order_cubit.dart';
class MyOrderListView extends StatelessWidget {
  const MyOrderListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>  GetMyOrderCubit(GetMyOrderRepoImp(ApiService(Dio())))..getMyOrder(),
    child: const SafeArea(
        child: Scaffold(
      body:MyOrderListBody() ,
    )));
  }
}
