import 'package:dartz/dartz.dart';
import '../../../../../../Core/error/faliure.dart';
import '../../models/product_byBrand_model.dart';
abstract class GetProductByBrandRepo {
      String? brand;
  Future<Either<Failure,List<ProductByBrandModel>>> getProductByBrand(brand,{int pageNum=1});
}