import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:levado/core/widgets/custom_textformfield.dart';
import '../../../../../Core/widgets/custom_button.dart';
import '../../view_model/update_information_cubit/update_information_cubit.dart';

class InputUpdateWidget extends StatelessWidget {
  const InputUpdateWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    String ? email;
    String ? name;
    String ? phone;
    String ? address;
    final emailController = TextEditingController();
    final  addressController = TextEditingController();
     final nameController = TextEditingController();
    final phoneController = TextEditingController();
    return Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.always,
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
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
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: AppTextFormField(
                keyboardType:TextInputType.text,
                ctrl: addressController,
                validator:    (data) {
                  if (data!.isEmpty) {
                    return 'Please enter some text';
                  }
                },
                onFieldSubmitted: (value){
                  address =value;
                },
                prefixIcon: const Icon(Icons.home),

                hintText: "Address",
                label: const Text("Address"),
              ),
            ),





            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 10),
              child: CustomButton(
                name: "Update",
                onTap: () {
                  if(formKey.currentState?.validate() == true){
                    email = emailController.text;
                    name = nameController.text;
                    phone = phoneController.text;
                    address =addressController.text;


                   BlocProvider.of<UpdateInformationCubit>(context).updateInformation(
                      name!,
                      email!,
                      phone! ,
                      address!,
                    );

                  }
                },),
            )
          ],
        ));
  }
}