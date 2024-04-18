import 'package:dartz/dartz.dart';
import '../../../../../../Core/error/faliure.dart';
abstract class UpdateInformationRepo {
  Future<Either<Failure,String>> updateInformationRepo(
      String name,
      String email,
      String  phone,
      String address,


      );
}
