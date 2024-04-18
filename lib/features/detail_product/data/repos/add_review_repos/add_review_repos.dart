import 'package:dartz/dartz.dart';
import '../../../../../../Core/error/faliure.dart';
 abstract class  AddReviewRepo {

  Future<Either<Failure, String>> addReviewProduct(
      String  review,
      String  rate,
      String productId


      )
  ;
}