import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:levado/core/Utils/api_service.dart';
import '../../../../../Core/Utils/app_shared_preferences.dart';
import '../../../../../Core/error/faliure.dart';
import '../../models/detail_modle.dart';
import 'detailproduct_repo.dart';

class GetDetailProductRepoImp implements GetDetailProductRepo {
  final ApiService apiService;
  @override
  String? slug;
  GetDetailProductRepoImp(this.apiService);

  @override
  Future<Either<Failure,DetailProductModel >> getDetailProduct(slug) async {
    try {
      final tokenStorage = TokenStorage();
      String? token = await tokenStorage.getToken();
      var response = await apiService.getMap(endpoint:"product/$slug/",);
      DetailProductModel data = DetailProductModel.fromJson(response);
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