import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:levado/features/home/data/models/Wishlist_model.dart';
import 'package:levado/features/home/data/repos/wishlist_Repos/wishlist_repo.dart';
  part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit(this.wishlistRepo) : super(WishlistInitial());
  final WishlistRepo wishlistRepo;


  Future<void> wishlist({required String productId}) async {

      emit(WishlistLoading());

    var result = await  wishlistRepo.wishlistRepo(productId) ;
    result.fold((failure) {
          emit(WishlistFailure(failure.errmessage));

    }, (wishlistData) {

      emit(WishlistSuccess(wishlistData));
    });
  }
}
