import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:levado/features/home/data/models/cart_model.dart';
 import '../../../data/repos/get_cartRepos/get_cart_repo.dart';
part 'get_cart_state.dart';

class GetCartCubit extends Cubit<GetCartState> {
  GetCartCubit(this.getCartRepo) : super(GetCartInitial());
  final GetCartRepo getCartRepo;


  Future<void> getCart() async {

      emit(GetCartLoading());

    var result = await getCartRepo.getCart();
    result.fold((failure) {
         emit(GetCartFailure(failure.errmessage));

    }, (allCart) {
      emit(GetCartSuccess(allCart));
    });
  }
}
