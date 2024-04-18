  import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:levado/features/home/data/repos/delete_cart_productRepos/delete_cart_product_repo_imp.dart';
import 'package:levado/features/home/data/repos/get_cart_summary_Repos/get_cart_repo_summary_imp.dart';
import 'package:levado/features/home/presentation/view/widget/cart_scroll.dart';
import 'package:levado/features/home/presentation/view_models/get_cart_cubit/get_cart_cubit.dart';
import 'package:levado/features/home/presentation/view_models/get_cart_summary_cubit/get_cart_summary_cubit.dart';
import '../../../../core/Utils/api_service.dart';
import '../../data/repos/get_cartRepos/get_cart_repo_implemntaion.dart';
import '../view_models/delete_cart_cubit/delete_cart_cubit.dart';



class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [ BlocProvider(
        create: (context) => GetCartCubit(GetCartRepoImp(ApiService(Dio())))..getCart(),
        ),

        BlocProvider(
        create: (context) => DeleteCartCubit(DeleteCartProductRepoImp(ApiService(Dio()))) ),
         BlocProvider(
        create: (context) => GetCartSummaryCubit(GetCartSummaryRepoImp(ApiService(Dio())))..getSummaryCart(),
    )


        ],  child: const SafeArea(
        child: CartScroll(),

    ),);
  }
}