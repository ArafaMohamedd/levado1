import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:levado/core/Utils/api_service.dart';
import '../../../../../../Core/error/faliure.dart';
import 'coupon_repo.dart';

class CouponRepoImp implements CouponRepo {
  final ApiService apiService;
  CouponRepoImp(this.apiService);

  @override
  Future<Either<Failure,String>>couponRepo(
      String coupon,
      String  oid,
      ) async {
    try {
       var data= await apiService.post(endpoint:"coupon/",
         data: {
        "coupon_code": coupon,
           "order_oid":oid,
      });

      return  right(data["message"]);
    } catch (e) {
      if (e is  DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}