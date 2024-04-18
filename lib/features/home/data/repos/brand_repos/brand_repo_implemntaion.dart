import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:levado/core/Utils/api_service.dart';
   import '../../../../../Core/Utils/app_shared_preferences.dart';
import '../../../../../Core/error/faliure.dart';
 import '../../models/brand_model.dart';
 import 'brand_repo.dart';

class GetBrandRepoImp implements GetBrandRepo {
  final ApiService apiService;
  GetBrandRepoImp(this.apiService);

  @override
  Future<Either<Failure,List<BrandModel> >> getBrand() async {
    try {
      final tokenStorage = TokenStorage();
      String? token = await tokenStorage.getToken();
      var response = await apiService.getList(endpoint:"brand/",);
       List<BrandModel> data = response.map<BrandModel>((json) => BrandModel.fromJson(json)).toList();
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