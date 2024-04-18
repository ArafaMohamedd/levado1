import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:levado/core/Utils/api_service.dart';
import '../../../../../Core/error/faliure.dart';
import '../../models/product_model.dart';
import 'product_repo.dart';

class GetProductRepoImp implements GetProductRepo {
  final ApiService apiService;
  int maxPage = 1;

  GetProductRepoImp(this.apiService);

  @override
  Future<Either<Failure, List<ProductModel>>> getProduct(
      {int pageNum = 1,
      String brand = "",
      category = "",
      String endPrice = "",
        String beginPrice = ""}) async {
    try {
      if (pageNum <= maxPage) {

        String range = (beginPrice.isEmpty || endPrice.isEmpty)
            ? ""
            : "$beginPrice,$endPrice";

        Map<String, dynamic> queryParams = {
          'brand__title': brand,
          "category__title": category,
          'color': '',
          'page': pageNum,
          'price__gte': "",
          'price__lte': '',
          'price__range': range,
          "rating":"",
          "title__icontains": "",
        };

        var response = await apiService.getMap(
            endpoint: "product/", queryParams: queryParams);
        final List<dynamic> results = response['results'];
        maxPage = response['num_pages'];
        List<ProductModel> data = results
            .map<ProductModel>((json) => ProductModel.fromJson(json))
            .toList();

        return right(data);
      } else {
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
