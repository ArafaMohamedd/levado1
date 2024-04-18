import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:levado/features/checkout/data/repos/get_conformation_data_Repos/get_conformation_data_repo.dart';

import '../../../data/models/information_order_model.dart';
part 'information_order_data_state.dart';

class InformationOrderDataCubit extends Cubit<InformationOrderDataState> {
  InformationOrderDataCubit(this.getConformationDataRepo)
      : super(InformationOrderDataInitial());
  final GetConformationDataRepo getConformationDataRepo;

  Future<void> getConformationData(

  {
  required  String  oid,
  }
  ) async {
    emit(InformationOrderDataLoading());
    var result = await getConformationDataRepo.getConformationData(oid: oid);
    result.fold(
      (failure) {
        emit(InformationOrderDataFailure(failure.errmessage));
      },
      (success) {
        emit(InformationOrderDataSuccess(success));
      },
    );
  }
}
