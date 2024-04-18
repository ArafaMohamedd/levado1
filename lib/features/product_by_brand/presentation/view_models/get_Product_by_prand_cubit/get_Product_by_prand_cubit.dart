import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/product_byBrand_model.dart';
import '../../../data/repos/productByBrandRepos/product_byBrand_repo.dart';
part 'get_product_by_prand_state.dart';

class GetProductByBrandCubit extends Cubit<GetProductByBrandState> {
  GetProductByBrandCubit(this.getProductByBrandRepo) : super(GetProductByBrandInitial());
   final GetProductByBrandRepo getProductByBrandRepo;


  Future<void> getProductByBrand(String? brand,{int pageNum=1,})async
  {

    if(pageNum==1){
      emit(GetProductByBrandLoading());
    }else{
      emit(GetPaginationLoading());
    }

    var result =await getProductByBrandRepo.getProductByBrand(brand,pageNum:pageNum);
    result.fold((failure){

      if(pageNum==1){
        emit(GetProductByBrandFailure(failure.errmessage));
      }else{
        emit(GetPaginationFailure(failure.errmessage));
      }
     }, (allProductByCategory){
      emit( GetProductByBrandSuccess(allProductByCategory));

    }
    );

  }
}
