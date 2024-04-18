
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:levado/core/Utils/styles.dart';
import 'package:levado/core/widgets/custom_textformfield.dart';
import 'package:levado/features/Authentication/presentation/view/widget/underlined_widget.dart';
import '../../../../../../Core/widgets/custom_button.dart';
 import '../../view_models/login_cubit/login_cubit.dart';
import 'choose_login_register_widget.dart';

class BodyInputLoginWidget extends StatelessWidget {
  const BodyInputLoginWidget({super.key});


  @override
  Widget build(BuildContext context) {

    GlobalKey<FormState> formKey = GlobalKey();
    String ? email;
    String ? password;
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return  Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(15),
            child: ChooseLoginRegisterWidget(),
          ),

          const UnderLinedWidget(),

          SizedBox(height: 40,),

          Padding(padding: EdgeInsets.all(15),
            child: Center(
              child: Text("levado",style: Styles.textStyle90 ),

                )

          ),

          SizedBox(height: 40,),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: AppTextFormField(
              label:const Text("Email"),
              keyboardType:TextInputType.emailAddress,
              ctrl: emailController,
              validator:    (data) {
      if (data!.isEmpty) {
      return 'Please enter some text';
      }
      },
              onFieldSubmitted: (value){
                email =value;
              },
              prefixIcon: const Icon(Icons.mail),
              hintText: "Email",

            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: AppTextFormField(
              ctrl: passwordController,

              validator:    (data) {
                if (data!.isEmpty) {
                  return 'Please enter some text';
                }
              },
              onFieldSubmitted: (value){
                password =value;
              },
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: const Icon(Icons.remove_red_eye),
              hintText: "password",
              label:const Text("password"),
            ),
          ),
          SizedBox(height: 40,),
          
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 70,),
            child: Container(

              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), // Adjust the radius value as needed
            ),
              child: CustomButton(
                name: "Login",
                onTap: () {

if(formKey.currentState?.validate() == true){
    email = emailController.text;
  password = passwordController.text;
  BlocProvider.of<LoginCubit>(context).login(email!, password!);


      }

                },),
            ),
          )
        ],
      ),
    );
  }
}