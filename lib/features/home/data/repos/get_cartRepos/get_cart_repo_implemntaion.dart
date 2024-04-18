import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:levado/core/Utils/api_service.dart';
import 'package:levado/features/home/data/models/cart_model.dart';
import '../../../../../Core/error/faliure.dart';
 import '../../../../../core/Utils/app_shared_preferences.dart';
import 'get_cart_repo.dart';


class GetCartRepoImp implements GetCartRepo {
  final ApiService apiService;


  GetCartRepoImp(this.apiService);

  @override
  Future<Either<Failure, List<CartItemModel>>> getCart() async {
    try {

      String? serId =await  UserIdStorage().getUserIdKey();
        var response = await apiService.getList(endpoint: "cart-list/$serId",);

        List<CartItemModel> data = response.map<CartItemModel>((json) => CartItemModel.fromJson(json)).toList();

        return right(data);
      } catch (e) {
      print(e);
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
