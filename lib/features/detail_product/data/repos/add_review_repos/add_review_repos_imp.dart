

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:levado/core/Utils/app_shared_preferences.dart';

import '../../../../../Core/error/faliure.dart';
import '../../../../../core/Utils/api_service.dart';
import 'add_review_repos.dart';

class AddReviewImp implements AddReviewRepo{
  final ApiService apiService;
  AddReviewImp(this.apiService);

  @override
  Future<Either<Failure, String>> addReviewProduct(
      String  review,
      String  rate,
String productId
      )async {
    try {
      String? serId =await  UserIdStorage().getUserIdKey();

      String? country = await  CityStorage().getCityKey();
      var data= await apiService.post(endpoint:"reviews/",
          data:{
            "user_id": serId,
            "product_id": productId,
            "rating": rate,
            "review": review,
      });

      return right(data['message']);

    } catch (e) {
      print(e);
      if(e is DioError){

        return left( ServerFailure.fromDioError(e));
      }
      return left(ServerFailure("Please check your data"));

    }


  }
}
