import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
  import '../../../data/models/my_order_model.dart';
import '../../../data/repos/get_My_orders_Repos/get_my_order_repo.dart';
 part 'get_my_order_state.dart';

class GetMyOrderCubit extends Cubit<GetMyOrderState> {
  GetMyOrderCubit(this.getMyOrderRepo) : super(GetMyOrderInitial());
  final GetMyOrderRepo getMyOrderRepo;


  Future<void>  getMyOrder() async {

      emit(GetMyOrderLoading());

    var result = await getMyOrderRepo.getMyOrder();
    result.fold((failure) {
         emit(GetMyOrderFailure(failure.errmessage));

    }, (myOrder) {
      emit(GetMyOrderSuccess(myOrder));
    });
  }
}
