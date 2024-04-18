part of 'get_cart_cubit.dart';

@immutable
abstract class GetCartState {}

class GetCartInitial extends GetCartState {}
class GetCartLoading extends GetCartState {}

class GetCartFailure extends GetCartState {
  final String errMessage;

  GetCartFailure(this.errMessage);
}
class GetCartSuccess extends GetCartState {
  final List<CartItemModel> allCart;

  GetCartSuccess(this.allCart);
}
