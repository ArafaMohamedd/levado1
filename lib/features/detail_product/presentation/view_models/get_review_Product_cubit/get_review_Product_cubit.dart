import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:levado/features/detail_product/data/models/review_model.dart';
import '../../../data/repos/get_reviews_repos/get_reviews_repo.dart';
part 'get_review_Product_state.dart';

class GetReviewProductCubit extends Cubit<GetReviewProductState> {
  GetReviewProductCubit(this.getReviewProductRepo) : super(GetReviewProductInitial());
   final GetReviewProductRepo getReviewProductRepo;


  Future<void> getReviewProduct(String? idProduct )async
  {
    emit(GetReviewProductLoading());

    var result =await getReviewProductRepo.getReviewProduct(idProduct);
    result.fold((failure){
      emit(GetReviewProductFailure(failure.errmessage));
    }, (reviewProduct){
      emit( GetReviewProductSuccess(reviewProduct));

    }
    );

  }
}
