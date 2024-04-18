  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/delete_cart_productRepos/delete_cart_product_repo.dart';
part 'delete_cart_state.dart';

class DeleteCartCubit extends Cubit<DeleteCartState> {
  DeleteCartCubit(this.deleteCartProductRepoImp) : super(DeleteCartInitial());
   final DeleteCartProductRepo deleteCartProductRepoImp;


  Future<void> deleteCartProduct (String cartId)async
  {
    emit(DeleteCartLoading());

    var result =await deleteCartProductRepoImp.deleteCartProduct(cartId);
    result.fold((failure){
      emit(DeleteCartFailure(failure.errmessage));
    }, (deleteCart){
      emit( DeleteCartSuccess(deleteCart));

    }
    );

  }
}
