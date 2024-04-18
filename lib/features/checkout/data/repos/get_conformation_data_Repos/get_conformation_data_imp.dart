import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:levado/core/Utils/api_service.dart';
import 'package:levado/features/checkout/data/models/information_order_model.dart';
 import '../../../../../Core/error/faliure.dart';
 import 'get_conformation_data_repo.dart';


class GetInformationOrderRepoImp implements  GetConformationDataRepo {
  final ApiService apiService;


  GetInformationOrderRepoImp(this.apiService);

  @override
  Future<Either<Failure, InformationOrder>> getConformationData(
      {required String oid}) async {
    try {

         var response = await apiService.getMap(endpoint: "checkout/$oid/",);

      InformationOrder data = InformationOrder.fromJson(response);

        return right(data);
      } catch (e) {
       if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
