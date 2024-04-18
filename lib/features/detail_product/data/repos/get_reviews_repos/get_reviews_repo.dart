import 'package:dartz/dartz.dart';
import '../../../../../../Core/error/faliure.dart';
 import '../../models/review_model.dart';
 abstract class GetReviewProductRepo {

  Future<Either<Failure, ReviewModel>> getReviewProduct(String? idProduct);
}