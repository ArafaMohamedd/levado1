import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repos/update_information_Repos/update_information_repo.dart';
part 'update_information_state.dart';

class  UpdateInformationCubit extends Cubit< UpdateInformationState> {
  UpdateInformationCubit(this.updateInformationRepo)
      : super( UpdateInformationInitial());
  final  UpdateInformationRepo  updateInformationRepo;

  Future<void>  updateInformation(
    String name,
    String email,
    String phone,
    String address,

  ) async {
    emit( UpdateInformationLoading());
    var result = await  updateInformationRepo.updateInformationRepo(
        name, email, phone, address,);
    result.fold(
      (failure) {
        emit( UpdateInformationFailure(failure.errmessage));
      },
      (success) {
        emit( UpdateInformationSuccess(success));
      },
    );
  }
}
