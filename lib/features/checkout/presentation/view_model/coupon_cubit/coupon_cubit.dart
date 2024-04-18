 import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:levado/features/checkout/data/repos/coupon_Repos/coupon_repo.dart';
 import 'coupon_state.dart';

class CouponCubit extends Cubit<CouponState> {
  CouponCubit(this.couponRepo)
      : super(CouponInitial());
  final CouponRepo couponRepo;

  Future<void> coupon(
    String coupon,
    String oid,

  ) async {
    emit(CouponLoading());
    var result = await couponRepo.couponRepo(coupon, oid);
    result.fold(
      (failure) {
        emit(CouponFailure(failure.errmessage));
      },
      (success) {
        emit(CouponSuccess(success));
      },
    );
  }
}
