part of 'delete_cart_cubit.dart';

@immutable
abstract class DeleteCartState {}

class DeleteCartInitial extends DeleteCartState {}
class DeleteCartLoading extends DeleteCartState {}

class DeleteCartFailure extends DeleteCartState {
  final String errMessage;

  DeleteCartFailure(this.errMessage);
}
class DeleteCartSuccess extends DeleteCartState {
  final String message;

  DeleteCartSuccess(this.message);
}
