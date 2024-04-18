import 'package:dartz/dartz.dart';
import '../../../../../core/error/faliure.dart';
abstract class LoginRepo {
  Future<Either<Failure,String>> login(String email, String password);
 }
