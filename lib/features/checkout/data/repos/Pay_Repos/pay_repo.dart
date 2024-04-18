import 'package:dartz/dartz.dart';
import '../../../../../../Core/error/faliure.dart';
abstract class PayRepo {
  Future<Either<Failure,String>> payRepo(
       String  oid,
      );
}
