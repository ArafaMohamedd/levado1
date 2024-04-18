import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
 import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
 import '../../../../../../Core/Utils/app_router.dart';
import '../../../../../../Core/widgets/Show_Snackbar.dart';
  import '../../view_models/signup_cubit/sign_up_cubit.dart';
import 'body_input_singup_widget.dart';

class SingUpBody extends StatelessWidget{
  const SingUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
     return  BlocConsumer<SignUpCubit, SignUpState>(
         listener: (context, state) {
           if (state is SignUpLoading) {
             isLoading = true;
           } else if (state is SignUpSuccess) {
             context.pushReplacement(AppRouter.kLoginView);
             isLoading = false;
           }else if(state is SignUpFailure){
             isLoading = false;
             showSnackBar(context, state.errMessage);

           }
         },builder:(context,state)=> ModalProgressHUD(
    inAsyncCall: isLoading,
    child:SingleChildScrollView(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
         children:  [
       //    const AuthenticationImage(),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(

               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(20), color: Colors.grey.shade300),
               child: const  BodyInputSingUPWidget(),
             ),
           ),

         ],
       ),
    ) ));
  }

}