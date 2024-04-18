import 'package:dartz/dartz.dart';
 import '../../../../../../Core/error/faliure.dart';
import '../../models/order_model.dart';

abstract class GetCartSummaryRepo {
  Future<Either<Failure, OrderModel>> getOrderCart();
}
