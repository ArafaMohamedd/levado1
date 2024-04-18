import 'package:dartz/dartz.dart';
import '../../../../../../Core/error/faliure.dart';
 abstract class  AddToCardRepo {

  Future<Either<Failure, String>> addToCardProduct(
  String productId,
  String price,
  String color,
  String size ,
  String shippingAmount,
      String  qun);
}