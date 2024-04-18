  import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repos/signupRepos/signup_repo.dart';
 part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.signUpStudentRepo) : super(SignUpInitial());
  final SignUpRepo signUpStudentRepo;
  Future<void> signUpStudent(
      String name,
      String email,
      String password,
      String  phone,
      String passwordConfirmation,
     )async
  {
    emit(SignUpLoading());
    var result =await signUpStudentRepo.signUp(name, email, password, passwordConfirmation,  phone,);
    if (result != null) {
      emit(SignUpFailure(result.errmessage));
    } else {
      emit(SignUpSuccess());
    }
  }
}
