import 'package:dartz/dartz.dart';
import '../../../../../../Core/error/faliure.dart';
abstract class PersonalInformationRepo {
  Future<Either<Failure,String>> personalInformationRepo(
      String name,
      String email,
      String  phone,
      String address,
      String  country,
      String  state,
      String  city,

      );
}
