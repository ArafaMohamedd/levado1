part of 'get_review_Product_cubit.dart';

@immutable
abstract class GetReviewProductState {}

class GetReviewProductInitial extends GetReviewProductState {}
class GetReviewProductLoading extends GetReviewProductState {}

class GetReviewProductFailure extends GetReviewProductState {
  final String errMessage;

  GetReviewProductFailure(this.errMessage);
}
class GetReviewProductSuccess extends GetReviewProductState {
  final ReviewModel  reviewProduct;

  GetReviewProductSuccess(this.reviewProduct);
}
