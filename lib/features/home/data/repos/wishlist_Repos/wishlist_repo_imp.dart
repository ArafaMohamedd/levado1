import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:levado/Core/Utils/app_shared_preferences.dart';
import 'package:levado/core/Utils/api_service.dart';
import 'package:levado/features/home/data/models/Wishlist_model.dart';
import '../../../../../../Core/error/faliure.dart';
import 'wishlist_repo.dart';

class WishlistRepoImp implements WishlistRepo {
  final ApiService apiService;
  WishlistRepoImp(this.apiService);

  @override
  Future<Either<Failure,WishlistModel>>wishlistRepo(
      String productId,

      ) async {
    try {
      String? serId =await  UserIdStorage().getUserIdKey();
      Map<String, dynamic> dataBody =productId.isEmpty?{
        "user_id":serId,
      }: {
        "product_id": productId,
        "user_id": serId,
      };
       var data= await apiService.post(endpoint:"customer/wishlist/create/",
         data:  dataBody
       );


      WishlistModel   respons = WishlistModel.fromJson( data);

      return  right(respons);
    } catch (e) {
      if (e is  DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}