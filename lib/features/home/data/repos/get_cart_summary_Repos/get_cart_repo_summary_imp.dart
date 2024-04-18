import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:levado/core/Utils/api_service.dart';
import 'package:levado/features/home/data/models/cart_model.dart';
import '../../../../../Core/error/faliure.dart';
 import '../../../../../core/Utils/app_shared_preferences.dart';
import '../../models/order_model.dart';
import 'get_cart_summary_repo.dart';


class GetCartSummaryRepoImp implements  GetCartSummaryRepo {
  final ApiService apiService;


  GetCartSummaryRepoImp(this.apiService);

  @override
  Future<Either<Failure, OrderModel>> getOrderCart() async {
    try {

      String? serId =await  UserIdStorage().getUserIdKey();
        var response = await apiService.getMap(endpoint: "cart-detail/$serId/",);

      OrderModel data = OrderModel.fromJson(response);

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
