import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:levado/core/Utils/api_service.dart';
import '../../../../../Core/Utils/app_shared_preferences.dart';
import '../../../../../Core/error/faliure.dart';
 import '../../models/review_model.dart';
import 'get_reviews_repo.dart';

class GetReviewProductRepoImp implements GetReviewProductRepo {
  final ApiService apiService;
  @override
  GetReviewProductRepoImp(this.apiService);

  @override
  Future<Either<Failure,ReviewModel >> getReviewProduct(String? idProduct) async {
    try {
        var response = await apiService.getMap(endpoint:"reviews/$idProduct/",);
      ReviewModel data = ReviewModel.fromJson(response);
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