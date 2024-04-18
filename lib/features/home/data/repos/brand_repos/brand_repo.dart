import 'package:dartz/dartz.dart';
import '../../../../../../Core/error/faliure.dart';
import '../../models/brand_model.dart';
 abstract class GetBrandRepo {
  Future<Either<Failure,List<BrandModel>>> getBrand();
}