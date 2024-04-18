import 'package:dartz/dartz.dart';
 import 'package:levado/features/my_orders/data/models/my_order_model.dart';
import '../../../../../../Core/error/faliure.dart';

abstract class GetMyOrderRepo {
  Future<Either<Failure, List<OrdersModel>>> getMyOrder();
}
