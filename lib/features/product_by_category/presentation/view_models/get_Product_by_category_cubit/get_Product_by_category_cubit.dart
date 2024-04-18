import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/product_bycategory_model.dart';
import '../../../data/repos/productRepos/product_repo.dart';


part 'get_Product_by_category_state.dart';

class GetProductByCategoryCubit extends Cubit<GetProductByCategoryState> {
  GetProductByCategoryCubit(this.getProductByCategoryRepo) : super(GetProductByCategoryInitial());
   final GetProductByCategoryRepo getProductByCategoryRepo;


  Future<void> getProductByCategory(String? category,{int pageNum=1,})async
  {

    if(pageNum==1){
      emit(GetProductByCategoryLoading());
    }else{
      emit(GetPaginationLoading());
    }

    var result =await getProductByCategoryRepo.getProductByCategory(category,pageNum:pageNum );
    result.fold((failure){
      if(pageNum==1){
        emit(GetProductByCategoryFailure(failure.errmessage));
      }else{
        emit(GetPaginationFailure(failure.errmessage));
      }
    }, (allProductByCategory){
      emit( GetProductByCategorySuccess(allProductByCategory));

    }
    );

  }
}
