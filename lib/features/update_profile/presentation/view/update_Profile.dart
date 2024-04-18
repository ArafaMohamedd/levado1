import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:levado/features/update_profile/presentation/view/widget/update_profile_body.dart';

import '../../../../core/Utils/api_service.dart';
import '../../data/repos/update_information_Repos/update_information_repo_imp.dart';
import '../view_model/update_information_cubit/update_information_cubit.dart';

class UpdateProfileView extends StatelessWidget{
  const UpdateProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => UpdateInformationCubit(UpdateInformationRepoImp(ApiService(Dio()))),
    child: const SafeArea(
        child:
        Scaffold(
      body: UpdateProfileBody(),
    ))
    );
  }

}