import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:levado/core/Utils/api_service.dart';
import '../../../../../Core/error/faliure.dart';
import '../../models/product_byBrand_model.dart';
import 'product_byBrand_repo.dart';

class GetProductByBrandRepoImp implements GetProductByBrandRepo {
  final ApiService apiService;
  int maxPage = 1;
  GetProductByBrandRepoImp(this.apiService);
  @override
  String? brand;

  @override
  Future<Either<Failure, List<ProductByBrandModel>>> getProductByBrand(brand,{int pageNum=1}) async {
    try {
      if (pageNum <= maxPage){
         var response = await apiService.getMap(
          endpoint: "product/brand/$brand/?page=$pageNum",
        );
        final List<dynamic> results = response['results'];
        maxPage = response['num_pages'];
        List<ProductByBrandModel> data = results
            .map<ProductByBrandModel>(
                (json) => ProductByBrandModel.fromJson(json))
            .toList();
        return right(data);
      }
      else {
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
