 import 'package:dio/dio.dart';
import 'package:levado/core/Utils/api_service.dart';
 import 'package:levado/features/Authentication/data/repos/signupRepos/signup_repo.dart';
 import '../../../../../../Core/error/faliure.dart';

class SignUpRepoImp implements SignUpRepo {
  final ApiService apiService;
  SignUpRepoImp(this.apiService);

  @override
  Future<Failure?> signUp(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String  phone,
      ) async {
    try {
     await apiService.post(endpoint:"user/register/", data: {
        "full_name": name,
        "email": email,
        "password": password,
          "phone":  phone,
        "password2":passwordConfirmation,

      });
      return null; // Return appropriate Failure object or null
    } catch (e) {
      if (e is  DioError) {
        return ServerFailure.fromDioError(e);
      }
      return ServerFailure(e.toString());
    }
  }
}