import 'package:dartz/dartz.dart';
 import '../../../../../../Core/error/faliure.dart';

abstract class DeleteCartProductRepo {
  Future<Either<Failure, String >> deleteCartProduct(String cartId);
}
