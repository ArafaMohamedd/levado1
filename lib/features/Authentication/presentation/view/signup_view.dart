import 'package:flutter/material.dart';
import 'package:levado/features/Authentication/presentation/view/widget/Singup_Body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  SafeArea(child: SingUpBody()),
    );
  }
}
