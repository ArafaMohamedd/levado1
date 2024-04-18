import 'package:dartz/dartz.dart';
import '../../../../../../Core/error/faliure.dart';
import '../../models/detail_modle.dart';
 abstract class GetDetailProductRepo {
    String? slug;
  Future<Either<Failure,DetailProductModel>> getDetailProduct(slug);
}