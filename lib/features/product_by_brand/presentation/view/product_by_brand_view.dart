import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import '../../../../core/Utils/api_service.dart';
 import '../../data/repos/productByBrandRepos/Product_byBrand_repo_implemntaion.dart';
 import '../view_models/get_Product_by_prand_cubit/get_Product_by_prand_cubit.dart';
import 'widget/product_by_brand_view_body.dart';


class ProductByBrandView extends StatelessWidget {
  ProductByBrandView({Key? key,required this.brand}) : super(key: key);
String? brand;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GetProductByBrandCubit(GetProductByBrandRepoImp(ApiService(Dio())))..getProductByBrand(brand),
    child:   SafeArea(
      child: Scaffold(
        body: ProductByBrandViewBody(brand: brand!,),
      ),
    )
    );
  }
}
