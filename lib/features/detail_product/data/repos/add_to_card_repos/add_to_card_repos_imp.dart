

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:levado/core/Utils/app_shared_preferences.dart';

import '../../../../../Core/error/faliure.dart';
import '../../../../../core/Utils/api_service.dart';
import 'add_to_card_repos.dart';

class AddToCardImp implements AddToCardRepo{
  final ApiService apiService;
  AddToCardImp(this.apiService);

  @override
  Future<Either<Failure, String>> addToCardProduct(
      String productId,
      String price,
      String color,
      String size ,
      String shippingAmount,
      String qun,

      )async {
    try {
      String? serId =await  UserIdStorage().getUserIdKey();

      String? country = await  CityStorage().getCityKey();
      var data= await apiService.post(endpoint:"cart-view/",
          data:{
        "product_id": productId,
            "user_id": serId,
            "qty": qun,
            "price": price,
            "shipping_amount": shippingAmount,
            "country": country,
            "size": size,
            "color":color,
            "cart_id":serId
      });

      return right(data['message']);

    } catch (e) {
      if(e is DioError){
        return left( ServerFailure.fromDioError(e));
      }
      return left(ServerFailure("Please check your email and password"));

    }


  }
}
