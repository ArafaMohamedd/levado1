
 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:levado/core/Utils/styles.dart';
import 'package:levado/core/widgets/custom_textformfield.dart';
import 'package:levado/features/Authentication/presentation/view/widget/underlined_widget.dart';

 import '../../../../../../Core/widgets/custom_button.dart';
  import '../../view_models/signup_cubit/sign_up_cubit.dart';
import 'choose_singup_register_widget.dart';

class BodyInputSingUPWidget extends StatelessWidget {
  const BodyInputSingUPWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    String ? email;
    String ? name;
    String ? password;
    String ? passwordConfirmation;
    String ? phone;




    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final  passwordConfirmationController = TextEditingController();
    final nameController = TextEditingController();
    final phoneController = TextEditingController();

    return Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.always,
        child:Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Padding(
          padding: EdgeInsets.all(15),
          child: ChooseUpRegisterWidget(),
        ),

        const UnderLinedWidget(),

        Padding(padding: EdgeInsets.all(15),
            child: Center(
              child: Text("levado",style: Styles.textStyle90, ),

            )

        ),


        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: AppTextFormField(
            keyboardType:TextInputType.name,
            ctrl: nameController,
            validator:    (data) {
              if (data!.isEmpty) {
                return 'Please enter some text';
              }
            },
            onFieldSubmitted: (value){
              name =value;
            },
            prefixIcon: const Icon(Icons.person),
            hintText: "name",

          ),
        ),


        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: AppTextFormField(
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
            label: const Text("Email"),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: AppTextFormField(
            keyboardType:TextInputType.visiblePassword,
            ctrl: passwordController,
            validator:    (data) {
              if (data!.isEmpty) {
                return 'Please enter some text';
              }
            },
            onFieldSubmitted: (value){
             password =value;
            },
            prefixIcon: const Icon(Icons.key),
            suffixIcon: const Icon(Icons.remove_red_eye),
            hintText: "Password",
            label: const Text("Password"),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: AppTextFormField(
            keyboardType:TextInputType.visiblePassword,
            ctrl: passwordConfirmationController,
            validator:    (data) {
              if (data!.isEmpty) {
                return 'Please enter some text';
              }
            },
            onFieldSubmitted: (value){
              password =value;
            },
            prefixIcon: const Icon(Icons.key),
            suffixIcon: const Icon(Icons.remove_red_eye),
            hintText: "Reset password ",
            label: const Text("Reset password"),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: AppTextFormField(
            keyboardType:TextInputType.phone,
            ctrl: phoneController,
            validator:    (data) {
              if (data!.isEmpty) {
                return 'Please enter some text';
              }
            },
            onFieldSubmitted: (value){
               phone =value;
            },
            prefixIcon: const Icon(Icons.phone_android),
            hintText: "Phone",
            label: const Text("Phone"),
          ),
        ),





        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 70),
          child: CustomButton(
            name: "Sign Up",
            onTap: () {
              if(formKey.currentState?.validate() == true){
                email = emailController.text;
                password = passwordController.text;
                passwordConfirmation=passwordConfirmationController.text;
                 name = nameController.text;
               phone = phoneController.text;

                BlocProvider.of<SignUpCubit>(context).signUpStudent(
                   name!,
                    email!,
                    password!,
                  phone! ,
                  passwordConfirmation!,




                     );

              }
            },),
        )
      ],
    ));
  }
}