import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:levado/features/detail_product/presentation/views/widgets/DetailProductBody.dart';
import '../../../../core/Utils/api_service.dart';
 import '../../data/repos/detail_repos/detailProduct_repo_implemntaion.dart';
import '../../data/repos/get_reviews_repos/get_reviews_repo_implemntaion.dart';
import '../view_models/get_detailProduct_cubit/get_detailProduct_cubit.dart';
import '../view_models/get_review_Product_cubit/get_review_Product_cubit.dart';

class DetailProductView extends StatelessWidget {
    Map<String, String> data;
        DetailProductView({Key? key,required this.data  }) : super(key: key);
   @override
  Widget build(BuildContext context) {
     final slug = data['slug'];
     final id = data['id'];
     return
       MultiBlocProvider(
           providers: [
         BlocProvider(
           create: (context) => GetDetailProductCubit(GetDetailProductRepoImp(ApiService(Dio())))..getDetailProduct(slug),
     ),
             BlocProvider(
               create: (context) => GetReviewProductCubit(GetReviewProductRepoImp(ApiService(Dio())))..getReviewProduct(id),
             ),   
           ],    child: const Scaffold(
         body:  SafeArea(
           child: DetailProductBody(),
         ),

       ),
       );
  }
}
