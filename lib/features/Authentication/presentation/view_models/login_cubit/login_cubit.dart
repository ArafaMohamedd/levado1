import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/loginRepos/login_repo.dart';
import 'login_state.dart';


class LoginCubit extends Cubit<LoginState> {

  LoginCubit(this.loginRepo) : super(LoginInitial());
  final LoginRepo loginRepo;

  Future<void> login(String email,String password)async
  {

    emit(LoginLoading());
    var result =await loginRepo.login(email, password);
    result.fold((failure){
      emit(LoginFailure(failure.errmessage));
    }, (token){

      emit( LoginSuccess(token));

    }
    );

  }


}
