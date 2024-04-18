import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:levado/core/Utils/api_service.dart';
import 'package:levado/features/home/data/repos/category_type/categoryType_repo.dart';
  import '../../../../../Core/Utils/app_shared_preferences.dart';
import '../../../../../Core/error/faliure.dart';
 import '../../models/type_category_model.dart';

class GetCategoryTypeRepoImp implements GetCategoryTypeRepo {
  final ApiService apiService;
  GetCategoryTypeRepoImp(this.apiService);

  @override
  Future<Either<Failure,List<TypeCategoryModel> >> getCategoryType() async {
    try {
      final tokenStorage = TokenStorage();
      String? token = await tokenStorage.getToken();
      var response = await apiService.getList(endpoint:"category/",);
       List<TypeCategoryModel> data = response.map<TypeCategoryModel>((json) => TypeCategoryModel.fromJson(json)).toList();
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