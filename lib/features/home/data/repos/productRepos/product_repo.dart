import 'package:dartz/dartz.dart';
import '../../../../../../Core/error/faliure.dart';
import '../../models/product_model.dart';

abstract class GetProductRepo {
  Future<Either<Failure, List<ProductModel>>> getProduct({
    int pageNum = 1,
    String brand = "",
    category = "",
    String endPrice = "",
    String beginPrice = ""
  });
}
