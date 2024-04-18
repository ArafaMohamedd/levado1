import 'package:flutter/cupertino.dart';

class AuthenticationImage extends StatelessWidget {
  const AuthenticationImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/Thesis-amico 1.png",
      height: MediaQuery.of(context).size.height * .3,
      width: MediaQuery.of(context).size.width * .7,
    );
  }
}
