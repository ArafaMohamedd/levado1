import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:levado/features/detail_product/presentation/views/widgets/Add_Reviews_Body.dart';

import '../../../../core/Utils/api_service.dart';
import '../../data/repos/add_review_repos/add_review_repos_imp.dart';
import '../view_models/add_Review_cubit/add_review_cubit.dart';

class AddReviewsView extends StatelessWidget{
    AddReviewsView({super.key,required this.productId});
 String productId;
  @override
  Widget build(BuildContext context) {
     return  BlocProvider(
       create: (context) => AddReviewCubit(AddReviewImp(ApiService(Dio()))) ,
         child:  SafeArea(child: Scaffold(
       body:AddReviewsBody(productId: productId,) ,
     )))
     ;
  }

}

