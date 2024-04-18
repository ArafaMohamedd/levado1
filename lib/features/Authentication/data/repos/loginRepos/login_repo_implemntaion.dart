import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:levado/core/Utils/api_service.dart';
 import '../../../../../core/Utils/app_shared_preferences.dart';
import '../../../../../core/error/faliure.dart';
import 'login_repo.dart';

class LoginRepoImp implements LoginRepo{
  final ApiService apiService;
  LoginRepoImp(this.apiService);

  @override
  Future<Either<Failure, String>> login(String email, String password)async {
   try {
     var data= await apiService.post(endpoint:"user/token/", data:{"email":email,"password":password});

     UserIdStorage().saveUserIdKey("${data["user"]['id']}");
     UserNameStorage().saveUserNameKey("${data["user"]['full_name']}");
     UserEmailStorage().saveUserEmailKey("${data["user"]['email']}");
     return right(data["tokens"]['access']);
     

     } catch (e) {
     if(e is DioError){
return left( ServerFailure.fromDioError(e));
   }
     return left(ServerFailure("Please check your email and password"));

   }


  }




}

