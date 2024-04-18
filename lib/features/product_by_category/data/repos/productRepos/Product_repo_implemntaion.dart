import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:levado/core/Utils/api_service.dart';
  import '../../../../../Core/Utils/app_shared_preferences.dart';
import '../../../../../Core/error/faliure.dart';
import '../../models/product_bycategory_model.dart';
import 'product_repo.dart';

class GetProductByCategoryRepoImp implements GetProductByCategoryRepo {
  final ApiService apiService;
  int maxPage = 1;
  GetProductByCategoryRepoImp(this.apiService);
  @override
  String? category;

  @override
  Future<Either<Failure,List<ProductByCategoryModel> >> getProductByCategory(category,{int pageNum=1}) async {
    try {
      if (pageNum <= maxPage){

         var response = await apiService.getMap(endpoint:"product/category/$category/?page=$pageNum",);
        final List<dynamic> results = response['results'];
        maxPage = response['num_pages'];
        List<ProductByCategoryModel> data = results.map<ProductByCategoryModel>((json) => ProductByCategoryModel.fromJson(json)).toList();
        return right(data);
      }else {
        return left(ServerFailure("Page number out of range"));
      }

    } catch (e) {
      print(e);
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}