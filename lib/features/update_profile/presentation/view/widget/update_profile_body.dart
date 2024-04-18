import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:levado/Core/Utils/app_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../Core/Utils/colors.dart';
import '../../../../../Core/Utils/styles.dart';
import '../../../../../Core/widgets/Show_Snackbar.dart';
import '../../view_model/update_information_cubit/update_information_cubit.dart';
import 'Input_update_Widget.dart';

class UpdateProfileBody extends StatelessWidget{
  const UpdateProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return  BlocConsumer<UpdateInformationCubit, UpdateInformationState>(
        listener: (context, state) {
      if (state is UpdateInformationLoading) {
        isLoading = true;
      } else if (state is UpdateInformationSuccess) {
        context.pushReplacement(AppRouter.kHomeView);
        isLoading = false;
      }else if(state is UpdateInformationFailure){
        isLoading = false;
        showSnackBar(context, state.errMessage);

      }
    },builder:(context,state)=> ModalProgressHUD(
    inAsyncCall: isLoading,
    child: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 2, top: 15),
            child: Container(
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(onPressed:  (){
                    context.pop();
                  }, icon:    Icon(Icons.arrow_back,color: AppColor.primaryColor,size: 32,)),
                  const SizedBox(width: 50,),
                  Center(
                    child: Text(
                      "Update Profile",
                      style: Styles.textStyle25.copyWith(
                          color: AppColor.primaryColor, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
          const InputUpdateWidget()
        ],
      ),
    )
    )
    );
  }

}