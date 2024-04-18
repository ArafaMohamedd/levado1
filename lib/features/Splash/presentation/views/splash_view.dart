 import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../Core/Utils/app_router.dart';
import '../../../../Core/Utils/app_shared_preferences.dart';

class SplashView extends StatefulWidget{
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
     Future.delayed(const Duration(seconds: 2), () {
       checkTokenAndPermissions(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Your splash screen content, e.g., an image
        child: Image.asset('assets/images/download.jpg'),
      ),
    );
  }
  Future<void> checkTokenAndPermissions(BuildContext context) async {
    final tokenStorage = TokenStorage();

     String? token = await tokenStorage.getToken();

    if (token == null) {
       context.pushReplacement(AppRouter.kLoginView);
    } else {
            context.pushReplacement(AppRouter.kHomeView);

    }
  }
}