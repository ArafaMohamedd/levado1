import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import '../../../../core/Utils/api_service.dart';
import '../../data/repos/productRepos/Product_repo_implemntaion.dart';
import '../view_models/get_Product_by_category_cubit/get_Product_by_category_cubit.dart';
import 'widget/product_by_category_view_body.dart';


class ProductByCategoryView extends StatelessWidget {
    ProductByCategoryView({Key? key,required this.category}) : super(key: key);
String? category;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GetProductByCategoryCubit(GetProductByCategoryRepoImp(ApiService(Dio())))..getProductByCategory(category),
    child:   SafeArea(
      child: Scaffold(
        body: ProductByCategoryViewBody(category: category!,),
      ),
    )
    );
  }
}
