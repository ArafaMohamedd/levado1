 import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:levado/core/Utils/api_service.dart';
  import '../../../../../../Core/error/faliure.dart';
import '../../../../../Core/Utils/app_shared_preferences.dart';
import 'personal_information_repo.dart';

class PersonalInformationRepoImp implements PersonalInformationRepo {
  final ApiService apiService;
  PersonalInformationRepoImp(this.apiService);

  @override
  Future<Either<Failure,String>>personalInformationRepo(
      String name,
      String email,
      String  phone,
      String address,
      String  country,
      String  state,
      String  city,
      ) async {
    try {
      String? serId =await  UserIdStorage().getUserIdKey();
      var data= await apiService.post(endpoint:"create-order/",
         data: {
        "full_name":name,
           "user_id":serId,
        "email": email,
           "mobile":phone,
        "address":address  ,
        "country":country ,
           "state":state,
           "city":city,
           "cart_id":serId,
      });

      return  right(data["order_oid"]);
    } catch (e) {
      if (e is  DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}