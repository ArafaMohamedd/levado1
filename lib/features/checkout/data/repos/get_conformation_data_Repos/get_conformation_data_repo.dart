import 'package:dartz/dartz.dart';
import 'package:levado/features/checkout/data/models/information_order_model.dart';
 import '../../../../../../Core/error/faliure.dart';

abstract class GetConformationDataRepo {

  Future<Either<Failure, InformationOrder>> getConformationData({required String oid});
}
