import 'package:dartz/dartz.dart';
import '../../../../../../Core/error/faliure.dart';
 import '../../models/type_category_model.dart';
abstract class GetCategoryTypeRepo {
  Future<Either<Failure,List<TypeCategoryModel>>> getCategoryType();
}