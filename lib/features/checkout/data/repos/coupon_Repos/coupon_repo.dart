import 'package:dartz/dartz.dart';
import '../../../../../../Core/error/faliure.dart';
abstract class CouponRepo {
  Future<Either<Failure,String>> couponRepo(
      String coupon,
      String  oid,
      );
}
