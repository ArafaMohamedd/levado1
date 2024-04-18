 import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:levado/core/Utils/colors.dart';

import '../../../../../../Core/Utils/styles.dart';
import '../../../../../core/Utils/app_router.dart';


class ChooseUpRegisterWidget extends StatelessWidget {
  const ChooseUpRegisterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
            onPressed: () {
              context.pushReplacement(AppRouter.kLoginView);
            },
            child: Text(
              "Login",
              style: Styles.textStyle25.copyWith(color:AppColor.textBodyColor) ,
            )),
        const Spacer(),
        TextButton(
          onPressed: () {

          },
          child: Text(
            "Sign Up",
            style: Styles.textStyle25.copyWith(color:AppColor.primaryColor),
          ),
        ),
      ],
    );
  }
}
