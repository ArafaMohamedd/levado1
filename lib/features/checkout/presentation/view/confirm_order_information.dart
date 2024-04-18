import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:levado/core/Utils/api_service.dart';
import 'package:levado/features/checkout/presentation/view/widget/Confirm_Order_Information_body.dart';

import '../../data/repos/get_conformation_data_Repos/get_conformation_data_imp.dart';
import '../view_model/information_order_data_cubit/information_order_data_cubit.dart';

class ConfirmOrderInformationView extends StatelessWidget {
    ConfirmOrderInformationView({super.key,required this.oid});
String oid;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => InformationOrderDataCubit(GetInformationOrderRepoImp(ApiService(Dio())))..getConformationData(oid: oid),
    child:    SafeArea(child: Scaffold(
      body: ConfirmOrderInformationBody(oid:oid),
    )
    )
    );
  }
}
