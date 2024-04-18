
import '../../../../../../Core/error/faliure.dart';
abstract class SignUpRepo {
  Future<Failure?> signUp(
      String name,
      String email,
      String password,
  String  phone,
      String  passwordConfirmation
      );
}
