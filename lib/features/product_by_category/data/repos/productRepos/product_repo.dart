import 'package:dartz/dartz.dart';
import '../../../../../../Core/error/faliure.dart';
import '../../models/product_bycategory_model.dart';
abstract class GetProductByCategoryRepo {
      String? category;
  Future<Either<Failure,List<ProductByCategoryModel>>> getProductByCategory(category,{int pageNum=1});
}