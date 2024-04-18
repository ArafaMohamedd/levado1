import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:levado/features/checkout/data/repos/personal_information_Repos/personal_information_repo.dart';
part 'personal_information_state.dart';

class PersonalInformationCubit extends Cubit<PersonalInformationState> {
  PersonalInformationCubit(this.personalInformationRepo)
      : super(PersonalInformationInitial());
  final PersonalInformationRepo personalInformationRepo;

  Future<void> personalInformation(
    String name,
    String email,
    String phone,
    String address,
    String country,
    String state,
    String city,
  ) async {
    emit(PersonalInformationLoading());
    var result = await personalInformationRepo.personalInformationRepo(
        name, email, phone, address, country, state, city);
    result.fold(
      (failure) {
        emit(PersonalInformationFailure(failure.errmessage));
      },
      (success) {
        emit(PersonalInformationSuccess(success));
      },
    );
  }
}
