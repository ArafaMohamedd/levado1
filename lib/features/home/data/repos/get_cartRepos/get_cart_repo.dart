import 'package:dartz/dartz.dart';
import 'package:levado/features/home/data/models/cart_model.dart';
import '../../../../../../Core/error/faliure.dart';

abstract class GetCartRepo {
  Future<Either<Failure, List<CartItemModel>>> getCart();
}
