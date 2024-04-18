import 'package:flutter/material.dart';
import 'package:levado/features/Authentication/presentation/view/widget/login_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return   const Scaffold(
       body: SafeArea(child: LoginBody()),
    );
  }
}
