import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:levado/core/Utils/api_service.dart';
import 'package:levado/features/my_orders/data/models/my_order_model.dart';
import 'package:levado/features/notifications/data/models/notifications_model.dart';
import '../../../../../Core/error/faliure.dart';
 import '../../../../../core/Utils/app_shared_preferences.dart';
import 'get_notifications_repo.dart';


class GetNotificationsRepoImp implements GetNotificationsRepo {
  final ApiService apiService;


  GetNotificationsRepoImp(this.apiService);

  @override
  Future<Either<Failure, List<NotificationsOrderModel>>> getNotifications() async {
    try {

      String? serId =await  UserIdStorage().getUserIdKey();
        var response = await apiService.getList(endpoint: "customer/notifications/$serId/",);

        List<NotificationsOrderModel> data = response.map<NotificationsOrderModel>((json) => NotificationsOrderModel.fromJson(json)).toList();

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
