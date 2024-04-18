import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:levado/core/Utils/api_service.dart';
import '../../../../../Core/error/faliure.dart';
import '../../../../../core/Utils/app_shared_preferences.dart';
import 'delete_notifications_repo.dart';
class DeleteNotificationsRepoImp implements DeleteNotificationsRepo {
  final ApiService apiService;
  DeleteNotificationsRepoImp(this.apiService);
  @override
  Future<Either<Failure, String>> deleteNotifications(String notificationsID) async {
    try {
      String? serId =await  UserIdStorage().getUserIdKey();
          await apiService.getMap(endpoint: "customer/notifications/$serId/$notificationsID",);
        return right("Delete");
      } catch (e) {
       if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
