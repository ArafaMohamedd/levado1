part of 'get_my_order_cubit.dart';

@immutable
abstract class GetMyOrderState {}

class GetMyOrderInitial extends GetMyOrderState {}
class GetMyOrderLoading extends GetMyOrderState {}

class GetMyOrderFailure extends GetMyOrderState {
  final String errMessage;

  GetMyOrderFailure(this.errMessage);
}
class GetMyOrderSuccess extends GetMyOrderState {
  final List<OrdersModel> allOrder;

  GetMyOrderSuccess(this.allOrder);
}
