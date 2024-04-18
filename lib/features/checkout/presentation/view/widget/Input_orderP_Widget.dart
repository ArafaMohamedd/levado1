
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:levado/core/widgets/custom_textformfield.dart';

import '../../../../../Core/widgets/custom_button.dart';
import '../../view_model/personal_information_cubit/personal_information_cubit.dart';

class InputOrderPWidget extends StatelessWidget {
  const InputOrderPWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    String ? email;
    String ? name;
    String ? phone;
    String ? address;
    String ? country;
    String ? state;
    String ? city;
    final emailController = TextEditingController();
    final  addressController = TextEditingController();
    final   countryController = TextEditingController();
    final   stateController = TextEditingController();
    final   cityController = TextEditingController();
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
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: AppTextFormField(
                keyboardType:TextInputType.text,
                ctrl: countryController,
                validator:    (data) {
                  if (data!.isEmpty) {
                    return 'Please enter some text';
                  }
                },
                onFieldSubmitted: (value){
                  country =value;
                },
                prefixIcon: const Icon(Icons.location_on_outlined),

                hintText: "Country ",
                label: const Text("Country"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: AppTextFormField(
                keyboardType:TextInputType.text,
                ctrl: stateController,
                validator:    (data) {
                  if (data!.isEmpty) {
                    return 'Please enter some text';
                  }
                },
                onFieldSubmitted: (value){
                  state =value;
                },
                prefixIcon: const Icon(Icons.maps_home_work_outlined),

                hintText: "State ",
                label: const Text("State"),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: AppTextFormField(
                keyboardType:TextInputType.text,
                ctrl: cityController,
                validator:    (data) {
                  if (data!.isEmpty) {
                    return 'Please enter some text';
                  }
                },
                onFieldSubmitted: (value){
                  phone =value;
                },
                prefixIcon: const Icon(Icons.location_city),
                hintText: "City",
                label: const Text("City"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 10),
              child: CustomButton(
                name: "Send",
                onTap: () {
                  if(formKey.currentState?.validate() == true){
                    email = emailController.text;
                    name = nameController.text;
                    phone = phoneController.text;
                    address =addressController.text;
                    country=countryController.text;
                    state=stateController.text;
                    city=cityController.text;

                    BlocProvider.of<PersonalInformationCubit>(context).personalInformation(
                      name!,
                      email!,
                      phone! ,
                      address!,
                      country!,
                      state!,
                      city!,

                    );

                  }
                },),
            )
          ],
        ));
  }
}