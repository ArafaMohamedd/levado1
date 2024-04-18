part of 'wishlist_cubit.dart';

@immutable
abstract class WishlistState {}

class WishlistInitial extends WishlistState {}
class WishlistLoading extends WishlistState {}

class WishlistFailure extends WishlistState {
  final String errMessage;

  WishlistFailure(this.errMessage);
}
class WishlistSuccess extends WishlistState {
  final  WishlistModel wishlistModel;

  WishlistSuccess(this.wishlistModel);
}
