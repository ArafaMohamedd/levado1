part of 'get_cart_summary_cubit.dart';

@immutable
abstract class GetCartSummaryState {}

class GetCartSummaryInitial extends GetCartSummaryState {}
class GetCartSummaryLoading extends GetCartSummaryState {}

class GetCartSummaryFailure extends GetCartSummaryState {
  final String errMessage;

  GetCartSummaryFailure(this.errMessage);
}
class GetCartSummarySuccess extends GetCartSummaryState {
  final OrderModel allSummaryCart;

  GetCartSummarySuccess(this.allSummaryCart);
}
