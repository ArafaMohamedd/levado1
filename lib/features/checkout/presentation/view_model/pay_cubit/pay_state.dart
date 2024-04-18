

import 'package:flutter/cupertino.dart';

@immutable
abstract class PayState {}

class PayInitial extends PayState {}

class PayLoading extends PayState {}

class PayFailure extends PayState {
  final String errMessage;

  PayFailure(this.errMessage);
}
class PaySuccess extends PayState
{
  String ms;
  PaySuccess(this.ms);
}
