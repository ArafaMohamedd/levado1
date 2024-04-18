 import 'package:flutter_bloc/flutter_bloc.dart';
  import '../../../data/repos/Pay_Repos/pay_repo.dart';
import 'pay_state.dart';

class PayCubit extends Cubit<PayState> {
  PayCubit(this.payRepo)
      : super(PayInitial());
  final PayRepo payRepo;

  Future<void>  pay(
     String oid,

  ) async {
    emit(PayLoading());
    var result = await payRepo.payRepo(oid);
    result.fold(
      (failure) {
        emit(PayFailure(failure.errmessage));
      },
      (success) {
        emit(PaySuccess(success));
      },
    );
  }
}
