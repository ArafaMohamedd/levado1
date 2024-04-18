import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:levado/core/Utils/api_service.dart';
import 'package:levado/core/Utils/app_shared_preferences.dart';
 import '../../../../../Core/error/faliure.dart';
import 'pay_repo.dart';

class PayRepoImp implements PayRepo {
  final ApiService apiService;

  PayRepoImp(this.apiService);

  @override
  Future<Either<Failure, String>> payRepo(
      String oid,
      ) async {
    try {
      String? serId = await UserIdStorage().getUserIdKey();
      var response = await apiService.postResponse(
        endpoint: "stripe-checkout/$oid/$serId/",
        data: {},
        options: Options(
          followRedirects: false,
        ),
      );

      print(response.data);
      return  left(response.data["error"]);
    } catch (e) {
      print(e);
      if (e is DioError) {
        if (e.response != null && e.response!.statusCode == 302) {
          String? redirectedUrl = e.response!.headers["location"]?.first;
          print(redirectedUrl);
          return right(redirectedUrl!);
         } else {
          return left(ServerFailure.fromDioError(e));
        }
      }
      return left(ServerFailure(e.toString()));
    }
  }
}

