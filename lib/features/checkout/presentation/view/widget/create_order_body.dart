import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:levado/core/Utils/app_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../Core/widgets/Show_Snackbar.dart';
import '../../view_model/personal_information_cubit/personal_information_cubit.dart';
import 'Input_orderP_Widget.dart';


class CreateOrderBody extends StatelessWidget {
  const CreateOrderBody({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return  BlocConsumer<PersonalInformationCubit, PersonalInformationState>(
        listener: (context, state) {
      if (state is PersonalInformationLoading) {
        isLoading = true;
      } else if (state is PersonalInformationSuccess) {
        context.push(AppRouter.kConfirmOrderInformationView,extra: state.ms);
        isLoading = false;
      }else if(state is PersonalInformationFailure){
        isLoading = false;
        showSnackBar(context, state.errMessage);

      }
    },builder:(context,state)=> ModalProgressHUD(
    inAsyncCall: isLoading,
    child:const SingleChildScrollView(
    child:  Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           Padding(
            padding:   EdgeInsets.all(8.0),
            child:  InputOrderPWidget(),
    ),


      ],
    ),
    ) ));
  }

}