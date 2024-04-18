import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
  import '../../../data/models/order_model.dart';
 import '../../../data/repos/get_cart_summary_Repos/get_cart_summary_repo.dart';
part 'get_cart_summary_state.dart';

class GetCartSummaryCubit extends Cubit<GetCartSummaryState> {
  GetCartSummaryCubit(this.getCartSummaryRepo) : super(GetCartSummaryInitial());
  final GetCartSummaryRepo getCartSummaryRepo;


  Future<void> getSummaryCart() async {

      emit(GetCartSummaryLoading());

    var result = await getCartSummaryRepo.getOrderCart();
    result.fold((failure) {
         emit(GetCartSummaryFailure(failure.errmessage));

    }, (allSummaryCart) {
      emit(GetCartSummarySuccess(allSummaryCart));
    });
  }
}
