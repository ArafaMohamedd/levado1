

import 'package:flutter/material.dart';

@immutable
abstract class AddReviewState {}

class AddReviewInitial extends AddReviewState {}
class AddReviewLoading extends AddReviewState {}

class AddReviewFailure extends AddReviewState {
  final String errMessage;

  AddReviewFailure(this.errMessage);
}
class AddReviewSuccess extends AddReviewState {
  final String   message;

  AddReviewSuccess(this.message);
}
