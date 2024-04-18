import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/detail_modle.dart';
import '../../../data/repos/detail_repos/detailproduct_repo.dart';


part 'get_detailProduct_state.dart';

class GetDetailProductCubit extends Cubit<GetDetailProductState> {
  GetDetailProductCubit(this.getDetailProductRepo) : super(GetDetailProductInitial());
   final GetDetailProductRepo getDetailProductRepo;


  Future<void> getDetailProduct(String?slug )async
  {
    emit(GetDetailProductLoading());

    var result =await getDetailProductRepo.getDetailProduct(slug);
    result.fold((failure){
      emit(GetDetailProductFailure(failure.errmessage));
    }, (detailProduct){
      emit( GetDetailProductSuccess(detailProduct));

    }
    );

  }
}
