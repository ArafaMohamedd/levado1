

import 'package:flutter/material.dart';

@immutable
abstract class AddToCardState {}

class AddToCardInitial extends AddToCardState {}
class AddToCardLoading extends AddToCardState {}

class AddToCardFailure extends AddToCardState {
  final String errMessage;

  AddToCardFailure(this.errMessage);
}
class AddToCardSuccess extends AddToCardState {
  final String   message;

  AddToCardSuccess(this.message);
}
