import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:levado/core/Utils/api_service.dart';
import 'package:levado/features/my_orders/data/models/my_order_model.dart';
import '../../../../../Core/error/faliure.dart';
 import '../../../../../core/Utils/app_shared_preferences.dart';
import 'get_my_order_repo.dart';


class GetMyOrderRepoImp implements GetMyOrderRepo {
  final ApiService apiService;


  GetMyOrderRepoImp(this.apiService);

  @override
  Future<Either<Failure, List<OrdersModel>>> getMyOrder() async {
    try {

      String? serId =await  UserIdStorage().getUserIdKey();
        var response = await apiService.getList(endpoint: "customer/orders/$serId/",);

        List<OrdersModel> data = response.map<OrdersModel>((json) => OrdersModel.fromJson(json)).toList();

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
