import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:levado/core/Utils/api_service.dart';
import 'package:levado/features/checkout/presentation/view/widget/create_order_body.dart';

import '../../data/repos/personal_information_Repos/personal_information_repo_imp.dart';
import '../view_model/personal_information_cubit/personal_information_cubit.dart';


class CreateOrderView extends StatelessWidget {
  const CreateOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => PersonalInformationCubit(PersonalInformationRepoImp(ApiService(Dio()))),
        child:    const SafeArea(
      child: Scaffold(

        body:  CreateOrderBody()
      ),
    )
    );
  }
}
