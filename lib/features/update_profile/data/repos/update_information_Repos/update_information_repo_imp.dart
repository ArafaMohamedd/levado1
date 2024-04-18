 import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:levado/core/Utils/api_service.dart';
  import '../../../../../../Core/error/faliure.dart';
import '../../../../../Core/Utils/app_shared_preferences.dart';
import 'update_information_repo.dart';

class  UpdateInformationRepoImp implements UpdateInformationRepo {
  final ApiService apiService;
  UpdateInformationRepoImp(this.apiService);

  @override
  Future<Either<Failure,String>>updateInformationRepo(
      String name,
      String email,
      String  phone,
      String address,

      ) async {
    try {
      String? userId =await  UserIdStorage().getUserIdKey();
      var data= await apiService.patch(endpoint:"user/profile/$userId/",
         data: {
             "full_name":name,
             "email": email,
             "mobile":phone,
             "address":address  ,

      });
       await  UserNameStorage().saveUserNameKey(data["full_name"]);
      await  UserEmailStorage().saveUserEmailKey(data["user"]["email"]);
      return  right("succeeded");
    } catch (e) {
      if (e is  DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}