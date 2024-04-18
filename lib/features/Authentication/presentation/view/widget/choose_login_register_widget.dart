 import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


import '../../../../../../Core/Utils/styles.dart';
import '../../../../../core/Utils/app_router.dart';
import '../../../../../core/Utils/colors.dart';


class ChooseLoginRegisterWidget extends StatelessWidget {
  const ChooseLoginRegisterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
            onPressed: () {},
            child: Text(
              "Login",
              style: Styles.textStyle25.copyWith(color: AppColor.primaryColor),
            )),
        const Spacer(),
        TextButton(
          onPressed: () {
           context.pushReplacement(AppRouter.kSignupView);
          },
          child: Text(
            "Sign Up",
            style: Styles.textStyle25.copyWith(color: AppColor.textBodyColor),
          ),
        ),
      ],
    );
  }
}
