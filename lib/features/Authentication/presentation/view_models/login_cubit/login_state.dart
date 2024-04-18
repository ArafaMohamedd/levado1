

import 'package:flutter/material.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}

class LoginFailure extends LoginState {
  final String errMessage;

  LoginFailure(this.errMessage);
}
class LoginSuccess extends LoginState {
  final String  token;

  LoginSuccess(this.token);
}
