

import 'package:flutter/cupertino.dart';

@immutable
abstract class CouponState {}

class CouponInitial extends CouponState {}

class CouponLoading extends CouponState {}

class CouponFailure extends CouponState {
  final String errMessage;

  CouponFailure(this.errMessage);
}
class CouponSuccess extends CouponState
{
  String ms;
  CouponSuccess(this.ms);
}
