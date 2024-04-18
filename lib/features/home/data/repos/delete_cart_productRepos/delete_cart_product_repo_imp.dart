import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:levado/core/Utils/api_service.dart';
import 'package:levado/features/home/data/models/cart_model.dart';
import '../../../../../Core/error/faliure.dart';
 import '../../../../../core/Utils/app_shared_preferences.dart';
import 'delete_cart_product_repo.dart';


class DeleteCartProductRepoImp implements DeleteCartProductRepo {
  final ApiService apiService;


  DeleteCartProductRepoImp(this.apiService);

  @override
  Future<Either<Failure,String>> deleteCartProduct(String cartId) async {
    try {

      String? serId =await  UserIdStorage().getUserIdKey();
        var response = await apiService.delete(endpoint: "cart-delete/$serId/$cartId/$serId/",);


        return  right( "");
      } catch (e) {
       if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
